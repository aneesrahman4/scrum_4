import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'providers/counter_provider.dart';
import 'providers/color_provider.dart';
import 'providers/calculator_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
      ],
      child: const MiniApps(),
    ),
  );
}

class MiniApps extends StatelessWidget {
  const MiniApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Apps',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
