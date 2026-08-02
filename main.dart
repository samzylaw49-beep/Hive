 import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const HiveApp());
}

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const LoginScreen(),
    );
  }
}