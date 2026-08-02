import 'package:flutter/material.dart';

void main() {
  runApp(const HiveApp());
}

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hive'),
        ),
        body: const Center(
          child: Text(
            'Welcome to Hive',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}