import 'package:flutter/material.dart';

import 'AboutPage.dart';
import 'HomePage.dart';

class HomeButtonNavigationPage extends StatefulWidget {
  const HomeButtonNavigationPage({super.key});

  @override
  State<HomeButtonNavigationPage> createState() =>
      _HomeButtonNavigationPageState();
}

class _HomeButtonNavigationPageState extends State<HomeButtonNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    AboutPage(),
  ];

  void _goHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void _showNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bạn chưa có thông báo mới'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
        ),
        title: Text(_currentIndex == 0 ? 'Trang chủ' : 'Giới thiệu'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _goHome,
            icon: const Icon(Icons.home),
            tooltip: 'Trang chủ',
          ),
          IconButton(
            onPressed: _showNotification,
            icon: const Icon(Icons.notifications),
            tooltip: 'Thông báo',
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Giới thiệu',
          ),
        ],
      ),
    );
  }
}
