import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/color_provider.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎨 Color Changer'),
        backgroundColor: colorProvider.color,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            color: colorProvider.color,
            child: const Center(
              child: Text(
                'Color Box',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: colorProvider.setRed,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Red'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: colorProvider.setGreen,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Green'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: colorProvider.reset,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
