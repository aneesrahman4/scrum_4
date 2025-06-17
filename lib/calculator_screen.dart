import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  void _calculate(String operation) {
    context.read<CalculatorProvider>().calculate(
      operation,
      _num1Controller.text,
      _num2Controller.text,
    );
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🧮 Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter first number',
              ),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter second number',
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children:
                  ['+', '-', '×', '÷'].map((op) {
                    return ElevatedButton(
                      onPressed: () => _calculate(op),
                      child: Text(op),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),

            Consumer<CalculatorProvider>(
              builder: (context, provider, _) {
                final result = provider.result;
                return Text(
                  result == null
                      ? 'Enter valid numbers'
                      : result == double.infinity
                      ? 'Cannot divide by zero'
                      : 'Result: $result',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
