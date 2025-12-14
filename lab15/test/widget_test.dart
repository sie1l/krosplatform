import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/main.dart';

void main() {
  group('Unit Tests', () {
    test('Перевірка розрахунку функції y = 100 - (x + x^2)', () {
      final calculator = FunctionCalculator();

      expect(calculator.calculate(0), 100);

      expect(calculator.calculate(1), 98);

      expect(calculator.calculate(4), 80);
    });
  });

  testWidgets('Перевірка UI елементів згідно варіанту 4', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("Kn-31: Solomiya's last Flutter App"), findsOneWidget);

    expect(find.byIcon(Icons.mouse), findsOneWidget);

    expect(find.text('0'), findsOneWidget);
    expect(find.text('4'), findsNothing);

    await tester.tap(find.byIcon(Icons.mouse));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.mouse));
    await tester.pump();

    expect(find.text('8'), findsOneWidget);
  });
}