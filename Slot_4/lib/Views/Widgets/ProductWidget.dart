import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  static const List<_SpecItem> _specs = [
    _SpecItem(Icons.payments, "Giá tiêu chuẩn", "8.870.000.000 VNĐ"),
    _SpecItem(Icons.bolt, "Công suất", "394 PS (290 kW)"),
    _SpecItem(Icons.speed, "0 - 100 km/giờ", "4,1 giây"),
    _SpecItem(Icons.timer, "Sport Chrono", "3,9 giây"),
    _SpecItem(Icons.trending_up, "Tốc độ tối đa", "294 km/giờ"),
    _SpecItem(Icons.settings, "Mô-men xoắn", "450 Nm"),
    _SpecItem(Icons.local_gas_station, "Tiêu thụ kết hợp", "10,6 lít/100 km"),
    _SpecItem(Icons.eco, "Khí thải CO2", "241 g/km"),
    _SpecItem(Icons.straighten, "Dài x cao", "4.542 x 1.302 mm"),
    _SpecItem(Icons.swap_horiz, "Chiều dài cơ sở", "2.450 mm"),
  ];

  static const List<_InfoSection> _sections = [
    _InfoSection(
      icon: Icons.sports_motorsports,
      title: "Giới thiệu xe",
      description:
          "Porsche 911 Carrera là mẫu xe thể thao biểu tượng với động cơ 6 xy-lanh đối đỉnh dung tích 3,0 lít đặt phía sau. Xe kết hợp thiết kế kinh điển, khả năng vận hành phấn khích và trải nghiệm tập trung vào người lái.",
      highlight:
          "Động cơ đặt sau - Thiết kế thể thao - Nội thất tập trung người lái",
    ),
    _InfoSection(
      icon: Icons.flash_on,
      title: "Hiệu suất vận hành",
      description:
          "Khối động cơ sản sinh công suất 394 PS và mô-men xoắn cực đại 450 Nm, giúp xe tăng tốc từ 0 - 100 km/giờ trong 4,1 giây. Với gói Sport Chrono, con số này còn rút xuống 3,9 giây.",
      highlight: "Tốc độ tối đa 294 km/giờ - PDK 8 cấp - Sport Chrono tùy chọn",
    ),
    _InfoSection(
      icon: Icons.lightbulb,
      title: "Thiết kế nổi bật",
      description:
          "911 Carrera giữ dáng coupe đặc trưng của Porsche, phần thân sau cơ bắp và hệ thống đèn Matrix LED hiện đại. Các chi tiết khí động học giúp chiếc xe trông sắc sảo và nhận diện rõ từ xa.",
      highlight: "Đèn Matrix LED - Thân xe thể thao - Dáng 911 kinh điển",
    ),
    _InfoSection(
      icon: Icons.dashboard,
      title: "Tiện nghi người lái",
      description:
          "Khoang lái được thiết kế xoay quanh người lái với cụm đồng hồ màn hình cong 12,65 inch, giao diện thể thao và cảm giác điều khiển đậm chất Porsche trong từng thao tác.",
      highlight:
          "Màn hình cong 12,65 inch - Giao diện thể thao - Trải nghiệm tập trung",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 330,
                child: Image.asset(
                  "assets/images/images.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 18,
                bottom: 18,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Add to cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Porsche 911 Carrera",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    Icon(Icons.star_half, color: Colors.amber, size: 24),
                    SizedBox(width: 10),
                    Text(
                      "4.8 (256 đánh giá)",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    Chip(
                      avatar: Icon(Icons.lightbulb, size: 18),
                      label: Text("Đèn Matrix LED"),
                    ),
                    Chip(
                      avatar: Icon(Icons.dashboard, size: 18),
                      label: Text("Màn hình cong 12,65 inch"),
                    ),
                    Chip(
                      avatar: Icon(Icons.sports_score, size: 18),
                      label: Text("Sport Chrono"),
                    ),
                    Chip(
                      avatar: Icon(Icons.precision_manufacturing, size: 18),
                      label: Text("PDK 8 cấp"),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                for (final section in _sections) ...[
                  _FeatureSection(section: section),
                  const SizedBox(height: 24),
                ],
                const Text(
                  "Thông số nổi bật",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _specs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.65,
                  ),
                  itemBuilder: (context, index) {
                    final spec = _specs[index];

                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.blueAccent.withValues(alpha: 0.18),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(spec.icon, color: Colors.blueAccent),
                          Text(
                            spec.label,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            spec.value,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureSection extends StatelessWidget {
  const _FeatureSection({required this.section});

  final _InfoSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(section.icon, color: Colors.blueAccent, size: 26),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                section.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          section.description,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 17,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                section.highlight,
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SpecItem {
  const _SpecItem(this.icon, this.label, this.value);

  final IconData icon;
  final String label;
  final String value;
}

class _InfoSection {
  const _InfoSection({
    required this.icon,
    required this.title,
    required this.description,
    required this.highlight,
  });

  final IconData icon;
  final String title;
  final String description;
  final String highlight;
}
