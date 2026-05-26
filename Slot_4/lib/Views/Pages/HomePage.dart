import 'package:flutter/material.dart';
import '../Widgets/ProductWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,

        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),

        title: const Text("Home Page"),
        centerTitle: true,

        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),

      body: const ProductWidget(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "Detail",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}
