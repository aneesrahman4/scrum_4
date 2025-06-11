import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../home_screen.dart';
import '../counter_screen.dart';
import '../color_screen.dart';
import '../calculator_screen.dart';
import 'app_route_constants.dart';

class MyRouterApp {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteConstants.home,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.counter,
        path: '/counter',
        builder: (context, state) => const CounterScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.color,
        path: '/color',
        builder: (context, state) => const ColorScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.calculator,
        path: '/calculator',
        builder: (context, state) => CalculatorScreen(),
      ),
    ],
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('Page Not Found'))),
  );
}
