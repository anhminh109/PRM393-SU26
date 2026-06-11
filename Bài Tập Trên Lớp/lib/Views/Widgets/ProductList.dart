import 'package:flutter/material.dart';

import '../../Entity/Product.dart';
import 'ProductWidget.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  final List<Product> products;
  final ValueChanged<Product> onProductTap;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text(
          'Không có sản phẩm',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return ProductWidget(
          product: product,
          onTap: () {
            onProductTap(product);
          },
        );
      },
    );
  }
}
