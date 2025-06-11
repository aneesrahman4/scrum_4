import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/app_route_configuration.dart';
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mini Apps with GoRouter + Provider',
      theme: ThemeData(primarySwatch: Colors.teal),
      routerConfig: MyRouterApp.router,
    );
  }
}
