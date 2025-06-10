import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  void _calculate(BuildContext context, String operation) {
    final calculatorProvider = Provider.of<CalculatorProvider>(
      context,
      listen: false,
    );
    calculatorProvider.calculate(
      operation,
      _num1Controller.text,
      _num2Controller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final result = context.watch<CalculatorProvider>().result;

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
              children: [
                ElevatedButton(
                  onPressed: () => _calculate(context, '+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(context, '-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(context, '×'),
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(context, '÷'),
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              result == null
                  ? 'Enter valid numbers'
                  : result == double.infinity
                  ? 'Cannot divide by zero'
                  : 'Result: $result',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
