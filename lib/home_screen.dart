import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_route_constants.dart';

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
            _buildNavButton(context, '➕ Counter', AppRouteConstants.counter),
            _buildNavButton(context, '🎨 Color', AppRouteConstants.color),
            _buildNavButton(
              context,
              '🧮 Calculator',
              AppRouteConstants.calculator,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String text, String routeName) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 200,
      child: ElevatedButton(
        onPressed: () => GoRouter.of(context).pushNamed(routeName),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(text, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
