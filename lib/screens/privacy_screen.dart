import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),

      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Text(
            """
Hive Privacy Policy

Welcome to Hive.

Your privacy matters to us. This page explains how information is handled when you use Hive.

Information We Collect:
- Account information you provide when creating an account.
- Content you choose to share on Hive.
- Information needed to improve the app experience.

How We Use Information:
- To provide Hive services.
- To improve features and security.
- To help users have a better experience.

Your Choices:
- You can manage your account information.
- You can control what you share on Hive.

By using Hive, you agree to this Privacy Policy.
            """,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}