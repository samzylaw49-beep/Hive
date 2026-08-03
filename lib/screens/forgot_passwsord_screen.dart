 import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final TextEditingController emailController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendResetLink() {

    final email = emailController.text.trim();

    if (email.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter your email.",
          ),
        ),
      );

      return;

    }

    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text(
            "Reset Password",
          ),

          content: Text(
            "A password reset link will be sent to:\n\n$email",
          ),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(context);
                Navigator.pop(context);

              },

              child: const Text(
                "Back to Login",
              ),

            ),

          ],

        );

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Forgot Password",
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Center(

          child: SingleChildScrollView(

            child: Column(

              children: [

                const Icon(
                  Icons.lock_reset,
                  size: 90,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Enter your email address below.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                TextField(

                  controller: emailController,

                 