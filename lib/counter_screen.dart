import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value:', style: TextStyle(fontSize: 24)),
            Consumer<CounterProvider>(
              builder:
                  (context, provider, _) => Text(
                    '${provider.counter}',
                    style: const TextStyle(fontSize: 32),
                  ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  '➖ Decrease',
                  context.read<CounterProvider>().decrement,
                ),
                const SizedBox(width: 15),
                _buildButton(
                  '➕ Increase',
                  context.read<CounterProvider>().increment,
                ),
                const SizedBox(width: 15),
                _buildButton('🔄 Reset', context.read<CounterProvider>().reset),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Text(text),
      ),
    );
  }
}
