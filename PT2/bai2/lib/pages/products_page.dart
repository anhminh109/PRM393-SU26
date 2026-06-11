import 'package:flutter/material.dart';

import '../dao/product_dao.dart';
import '../model/product.dart';
import 'product_detail_page.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductDAO _productDAO = ProductDAO();
  final TextEditingController _searchController = TextEditingController();

  List<Product> _products = const <Product>[];
  bool _isLoading = true;
  String? _errorMessage;
  int _selectedIndex = 0;
  int _requestId = 0;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadProducts() async {
    await _searchProducts('');
  }

  Future<void> _searchProducts(String keyword) async {
    final currentRequestId = ++_requestId;
    final normalizedKeyword = keyword.trim();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final products = normalizedKeyword.isEmpty
          ? await _productDAO.getAllProducts()
          : await _productDAO.findProductByName(normalizedKeyword);

      if (!mounted || currentRequestId != _requestId) {
        return;
      }

      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted || currentRequestId != _requestId) {
        return;
      }

      setState(() {
        _products = const <Product>[];
        _isLoading = false;
        _errorMessage = 'Unable to load products';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0B66E4),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
              child: _SearchField(
                controller: _searchController,
                onChanged: _searchProducts,
              ),
            ),
            Expanded(child: _buildProductsGrid()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF0B66E4),
        unselectedItemColor: const Color(0xFF3A3A3A),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Product Detail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    if (_products.isEmpty) {
      return const Center(child: Text('No products found'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final parentWidth = constraints.maxWidth;
          final orientation = MediaQuery.of(context).orientation;
          final crossAxisCount = _calculateCrossAxisCount(
            parentWidth,
            orientation,
          );
          final childAspectRatio = _getChildAspectRatio(
            parentWidth,
            crossAxisCount,
          );

          return GridView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: _products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) {
              final product = _products[index];

              // ProductCard tu co gian theo chieu rong cot do GridView cap.
              return ProductCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  int _calculateCrossAxisCount(double parentWidth, Orientation orientation) {
    if (parentWidth <= 500) {
      return orientation == Orientation.portrait ? 1 : 2;
    }

    return orientation == Orientation.portrait ? 2 : 3;
  }

  double _getChildAspectRatio(double maxWidth, int crossAxisCount) {
    const spacing = 16.0;
    final totalSpacing = spacing * (crossAxisCount - 1);
    final columnWidth = (maxWidth - totalSpacing) / crossAxisCount;

    return columnWidth >= 320 ? 2.15 : 0.72;
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: 'Search products...',
          prefixIcon: Icon(Icons.search_rounded),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
