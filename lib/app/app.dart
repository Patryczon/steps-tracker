import 'package:flutter/material.dart';
import 'package:superloop/dashboard/dashboard_screen.dart';
import 'package:superloop/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: const DashboardScreen(),
    );
  }
}
