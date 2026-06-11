import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:slot2/main.dart';

void main() {
  testWidgets('Ứng dụng hiển thị danh sách xe Porsche', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Trang chủ'), findsWidgets);
    expect(find.text('Porsche 911 Carrera'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byIcon(Icons.home), findsWidgets);
    expect(find.byIcon(Icons.notifications), findsOneWidget);
    expect(find.text('Giới thiệu'), findsOneWidget);
  });
}
