import 'package:flutter/material.dart';

import '../../Entity/Product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _rating = 0;

  String _formatPrice(double price) {
    final text = price.toStringAsFixed(0);
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      final reverseIndex = text.length - i;
      buffer.write(text[i]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }

    return '${buffer.toString()} VNĐ';
  }

  void _selectRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  product.image,
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.62),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          product.fuelType == 'Điện'
                              ? Icons.electric_car
                              : Icons.directions_car,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${product.year} - ${product.fuelType}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatPrice(product.price),
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Thông số nổi bật',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.85,
                    children: [
                      _SpecCard(
                        icon: Icons.speed,
                        title: '0 - 100 km/h',
                        value: product.acceleration,
                      ),
                      _SpecCard(
                        icon: Icons.bolt,
                        title: 'Công suất',
                        value: product.power,
                      ),
                      _SpecCard(
                        icon: Icons.rocket_launch,
                        title: 'Tốc độ tối đa',
                        value: product.topSpeed,
                      ),
                      _SpecCard(
                        icon: product.fuelType == 'Điện'
                            ? Icons.battery_charging_full
                            : Icons.local_gas_station,
                        title: product.fuelType == 'Điện'
                            ? 'Tầm hoạt động'
                            : 'Tiêu thụ',
                        value: product.consumption,
                      ),
                      _SpecCard(
                        icon: Icons.settings,
                        title: 'Hộp số',
                        value: product.transmission,
                      ),
                      _SpecCard(
                        icon: Icons.all_inclusive,
                        title: 'Hệ dẫn động',
                        value: product.drivetrain,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Điểm đặc sắc',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final highlight in product.highlights)
                        Chip(
                          avatar: const Icon(
                            Icons.auto_awesome,
                            color: Colors.blueAccent,
                            size: 18,
                          ),
                          label: Text(highlight),
                        ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Đánh giá của khách hàng',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (int index = 1; index <= 5; index++)
                        IconButton(
                          onPressed: () {
                            _selectRating(index);
                          },
                          icon: Icon(
                            index <= _rating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 34,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Text(
                        _rating == 0 ? 'Chưa đánh giá' : '$_rating/5 sao',
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Quay lại'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecCard extends StatelessWidget {
  const _SpecCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.16)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
