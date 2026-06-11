import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Giới thiệu ứng dụng',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Ứng dụng quản lý và hiển thị danh sách xe Porsche bằng Flutter. '
            'Project được tách theo Entity, Repository, Pages và Widgets để dễ bảo trì.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.blueAccent),
              SizedBox(width: 8),
              Expanded(child: Text('Danh sách xe Porsche được lấy từ ProductDAO')),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.blueAccent),
              SizedBox(width: 8),
              Expanded(child: Text('Có trang chi tiết và chức năng đánh giá sao')),
            ],
          ),
        ],
      ),
    );
  }
}
