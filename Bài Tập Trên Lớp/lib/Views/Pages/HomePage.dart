import 'package:flutter/material.dart';

import '../../Entity/Product.dart';
import '../../Repository/ProductDAO.dart';
import '../Widgets/ProductList.dart';
import 'ProductDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductDAO _productDAO = ProductDAO();
  late List<Product> _products;

  @override
  void initState() {
    super.initState();
    _products = _productDAO.getAll();
  }

  void _openProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProductList(
      products: _products,
      onProductTap: _openProductDetail,
    );
  }
}
