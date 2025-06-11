import 'package:flutter/material.dart';
import 'routes/app_route_configuration.dart';

void main() {
  runApp(const MiniApps());
}

class MiniApps extends StatelessWidget {
  const MiniApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mini Apps',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: MyRouterApp.router,
    );
  }
}
