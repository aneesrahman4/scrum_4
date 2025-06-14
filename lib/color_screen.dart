import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/color_provider.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Consumer<ColorProvider>(
          builder:
              (context, provider, _) => AppBar(
                title: const Text('🎨 Color Changer'),
                backgroundColor: provider.color,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ColorProvider>(
            builder:
                (context, provider, _) => Container(
                  height: 150,
                  width: 150,
                  color: provider.color,
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
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                'Red',
                Colors.red,
                context.read<ColorProvider>().setRed,
              ),
              const SizedBox(width: 10),
              _buildButton(
                'Green',
                Colors.green,
                context.read<ColorProvider>().setGreen,
              ),
              const SizedBox(width: 10),
              _buildButton(
                'Reset',
                Colors.grey,
                context.read<ColorProvider>().reset,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(label),
    );
  }
}
