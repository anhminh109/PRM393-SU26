import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0B66E4),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImage(product: product),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color(0xFF555555),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  _formatPrice(product.price),
                  style: const TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  _formatPrice(product.finalPrice),
                  style: const TextStyle(
                    color: Color(0xFFE91D35),
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE91D35),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Discount ${_formatDiscount(product.discountPercent)}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0 && Navigator.canPop(context)) {
            Navigator.pop(context);
          }
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
}

class _ProductImage extends StatelessWidget {
  final Product product;

  const _ProductImage({required this.product});

  @override
  Widget build(BuildContext context) {
    final image = product.image.startsWith('http')
        ? Image.network(
            product.image,
            fit: BoxFit.contain,
            errorBuilder: (imageContext, error, stackTrace) {
              return _ImageFallback(product: product);
            },
          )
        : Image.asset(
            product.image,
            fit: BoxFit.contain,
            errorBuilder: (imageContext, error, stackTrace) {
              return _ImageFallback(product: product);
            },
          );

    return Container(
      height: 280,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Center(child: image),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  final Product product;

  const _ImageFallback({required this.product});

  @override
  Widget build(BuildContext context) {
    return Icon(
      _iconForProduct(product.name),
      size: 96,
      color: const Color(0xFF0B66E4),
    );
  }
}

IconData _iconForProduct(String name) {
  final value = name.toLowerCase();

  if (value.contains('macbook') || value.contains('laptop')) {
    return Icons.laptop_mac_rounded;
  }

  if (value.contains('samsung')) {
    return Icons.phone_android_rounded;
  }

  return Icons.phone_iphone_rounded;
}

String _formatDiscount(double value) {
  if (value % 1 == 0) {
    return value.toStringAsFixed(0);
  }

  return value.toStringAsFixed(1);
}

String _formatPrice(double value) {
  final digits = value.round().toString();
  final buffer = StringBuffer();

  for (var i = 0; i < digits.length; i++) {
    final positionFromEnd = digits.length - i;
    buffer.write(digits[i]);

    if (positionFromEnd > 1 && positionFromEnd % 3 == 1) {
      buffer.write(',');
    }
  }

  return '${buffer.toString()} VND';
}
