import 'package:flutter/material.dart';

import 'AboutPage.dart';
import 'HomePage.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ứng dụng Porsche'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.inventory_2), text: 'Sản phẩm'),
              Tab(icon: Icon(Icons.info), text: 'Giới thiệu'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomePage(),
            AboutPage(),
          ],
        ),
      ),
    );
  }
}
