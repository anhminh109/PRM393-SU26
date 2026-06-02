import 'package:flutter_test/flutter_test.dart';

import 'package:lab_4/main.dart';

void main() {
  testWidgets('shows lab 4 exercise menu', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Lab 4 - Flutter UI Fundamentals'), findsOneWidget);
    expect(find.text('Exercise 1 - Core Widgets Demo'), findsOneWidget);
    expect(find.text('Exercise 5 - Common UI Fixes'), findsOneWidget);
  });
}
