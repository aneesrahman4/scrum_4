// lib/screens/color_screen.dart
import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _currentColor = Colors.grey;

  void _setRed() => setState(() => _currentColor = Colors.red);
  void _setGreen() => setState(() => _currentColor = Colors.green);
  void _reset() => setState(() => _currentColor = Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: _currentColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildColorButton('🔴 Red', _setRed),
                const SizedBox(width: 15),
                _buildColorButton('🟢 Green', _setGreen),
                const SizedBox(width: 15),
                _buildColorButton('🔄 Refresh', _reset),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(padding: const EdgeInsets.all(10), child: Text(text)),
    );
  }
}
