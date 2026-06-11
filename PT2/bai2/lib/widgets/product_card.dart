import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isHorizontal = constraints.maxWidth >= 320;

        return Card(
          margin: EdgeInsets.zero,
          elevation: 4,
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: isHorizontal
                      ? _HorizontalProductContent(product: product)
                      : _VerticalProductContent(product: product),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _DiscountBadge(percent: product.discountPercent),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HorizontalProductContent extends StatelessWidget {
  final Product product;

  const _HorizontalProductContent({required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = math.max(
          84.0,
          math.min(
            128.0,
            math.min(constraints.maxHeight, constraints.maxWidth * 0.3),
          ),
        );

        return Row(
          children: [
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: _ProductImage(product: product),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: _ProductInfo(
                product: product,
                reserveBadgeSpace: true,
                showDescription: constraints.maxHeight >= 150,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _VerticalProductContent extends StatelessWidget {
  final Product product;

  const _VerticalProductContent({required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final showDescription = constraints.maxHeight >= 320;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _ProductImage(product: product),
              ),
            ),
            const SizedBox(height: 12),
            _ProductInfo(product: product, showDescription: showDescription),
          ],
        );
      },
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final Product product;
  final bool reserveBadgeSpace;
  final bool showDescription;

  const _ProductInfo({
    required this.product,
    this.reserveBadgeSpace = false,
    this.showDescription = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(right: reserveBadgeSpace ? 70 : 0),
          child: Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              _formatPrice(product.price),
              style: const TextStyle(
                color: Color(0xFF707070),
                fontSize: 14,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
              ),
            ),
            Text(
              _formatPrice(product.finalPrice),
              style: const TextStyle(
                color: Color(0xFFE91D35),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        if (showDescription) ...[
          const SizedBox(height: 8),
          Text(
            product.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF6E6E6E),
              fontSize: 12,
              height: 1.35,
            ),
          ),
        ],
      ],
    );
  }
}

class _DiscountBadge extends StatelessWidget {
  final double percent;

  const _DiscountBadge({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE91D35),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '-${_formatDiscount(percent)}%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
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
      decoration: BoxDecoration(
        color: const Color(0xFFF1F6FF),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
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
      size: 56,
      color: const Color(0xFF0B66E4),
    );
  }
}

IconData _iconForProduct(String name) {
  final value = name.toLowerCase();

  if (value.contains('macbook') || value.contains('laptop')) {
    return Icons.laptop_mac_rounded;
  }

  if (value.contains('samsung') ||
      value.contains('xiaomi') ||
      value.contains('oppo')) {
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
