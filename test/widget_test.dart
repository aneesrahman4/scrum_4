// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scrum_4/main.dart';
import 'package:scrum_4/counter_screen.dart';
import 'package:scrum_4/color_screen.dart';
import 'package:scrum_4/calculator_screen.dart';

void main() {
  testWidgets('Home screen loads and navigates to counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiniApps());

    // Verify home screen shows all buttons
    expect(find.text('➕ Counter'), findsOneWidget);
    expect(find.text('🎨 Color'), findsOneWidget);
    expect(find.text('🧮 Calculator'), findsOneWidget);

    // Tap the counter button
    await tester.tap(find.text('➕ Counter'));
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify we're on the counter screen
    expect(find.byType(CounterScreen), findsOneWidget);
    expect(find.text('Counter Value: 0'), findsOneWidget);
  });

  testWidgets('Counter increments and decrements', (WidgetTester tester) async {
    // Directly load counter screen for focused testing
    await tester.pumpWidget(MaterialApp(home: CounterScreen()));

    // Initial value
    expect(find.text('Counter Value: 0'), findsOneWidget);

    // Increment
    await tester.tap(find.text('➕ Increase'));
    await tester.pump();
    expect(find.text('Counter Value: 1'), findsOneWidget);

    // Decrement
    await tester.tap(find.text('➖ Decrease'));
    await tester.pump();
    expect(find.text('Counter Value: 0'), findsOneWidget);

    // Reset
    await tester.tap(find.text('➕ Increase'));
    await tester.tap(find.text('➕ Increase'));
    await tester.pump();
    await tester.tap(find.text('🔄 Reset'));
    await tester.pump();
    expect(find.text('Counter Value: 0'), findsOneWidget);
  });

  testWidgets('Color screen changes color', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ColorScreen()));

    // Initial grey color
    final container = tester.widget<Container>(find.byType(Container).first);
    final boxDecoration = container.decoration as BoxDecoration;
    expect(boxDecoration.color, Colors.grey);

    // Change to red
    await tester.tap(find.text('🔴 Red'));
    await tester.pump();
    final redContainer = tester.widget<Container>(find.byType(Container).first);
    final redBoxDecoration = redContainer.decoration as BoxDecoration;
    expect(redBoxDecoration.color, Colors.red);

    // Reset to grey
    await tester.tap(find.text('🔄 Refresh'));
    await tester.pump();
    final resetContainer = tester.widget<Container>(
      find.byType(Container).first,
    );
    final resetBoxDecoration = resetContainer.decoration as BoxDecoration;
    expect(resetBoxDecoration.color, Colors.grey);
  });

  testWidgets('Calculator performs operations', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    // Enter numbers
    await tester.enterText(find.byType(TextField).at(0), '10');
    await tester.enterText(find.byType(TextField).at(1), '5');
    await tester.pump();

    // Test addition
    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('Result: 15.00'), findsOneWidget);

    // Test subtraction
    await tester.tap(find.text('-'));
    await tester.pump();
    expect(find.text('Result: 5.00'), findsOneWidget);

    // Test multiplication
    await tester.tap(find.text('×'));
    await tester.pump();
    expect(find.text('Result: 50.00'), findsOneWidget);

    // Test division
    await tester.tap(find.text('÷'));
    await tester.pump();
    expect(find.text('Result: 2.00'), findsOneWidget);

    // Test invalid input
    await tester.enterText(find.byType(TextField).at(0), 'abc');
    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('Enter valid numbers'), findsOneWidget);
  });
}
