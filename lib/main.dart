// lib/main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(const MiniApps());

class MiniApps extends StatelessWidget {
  const MiniApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Apps',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
