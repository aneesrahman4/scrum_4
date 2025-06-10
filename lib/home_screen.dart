import 'package:flutter/material.dart';

import 'counter_screen.dart';
import 'color_screen.dart';
import 'calculator_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Apps')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavButton(context, '➕ Counter', const CounterScreen()),
            _buildNavButton(context, '🎨 Color', const ColorScreen()),
            _buildNavButton(context, '🧮 Calculator', CalculatorScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String text, Widget screen) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 200,
      child: ElevatedButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(text, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
