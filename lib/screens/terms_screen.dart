import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms of Service"),
      ),

      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Text(
            """
Hive Terms of Service

Welcome to Hive.

By using Hive, you agree to follow these terms and use the platform responsibly.

Using Hive:
- Users should provide accurate account information.
- Users should respect other members of the community.
- Users should not use Hive for harmful or illegal activities.

Content:
- Users are responsible for the content they share.
- Hive aims to provide a safe and positive environment.

Accounts:
- Keep your account information secure.
- Follow Hive's community guidelines.

We may update these terms as Hive grows and improves.

Thank you for being part of Hive.
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