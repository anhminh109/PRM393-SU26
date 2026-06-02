import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1 - Core Widgets')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 24, 6, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Flutter UI',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 28),
              const Center(
                child: Icon(
                  Icons.movie,
                  color: Colors.blue,
                  size: 64,
                ),
              ),
              const SizedBox(height: 28),
              Image.asset(
                'assets/images/core_widgets_image.jpg',
                width: double.infinity,
                height: 154,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                color: const Color(0xFFF8F5FC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Color(0xFFE5E0EA)),
                ),
                child: const ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Movie Item'),
                  subtitle: Text('This is a sample ListTile inside a\nCard.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
