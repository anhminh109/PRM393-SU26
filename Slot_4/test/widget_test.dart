import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:slot2/main.dart';

void main() {
  testWidgets('Car introduction page renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Porsche 911 Carrera'), findsOneWidget);
    expect(find.text('Add to cart'), findsOneWidget);
    expect(find.text('Gioi thieu xe'), findsOneWidget);
    expect(find.byIcon(Icons.directions_car), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });
}
