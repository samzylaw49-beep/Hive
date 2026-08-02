import 'dart:math';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController glitchController;

  @override
  void initState() {
    super.initState();

    glitchController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    glitchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: glitchController,
          builder: (context, child) {
            double movement =
                sin(glitchController.value * pi * 2) * 3;

            return Transform.translate(
              offset: Offset(movement, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "H",
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome to Hive",
                    style: TextStyle(fontSize: 28),
                  ),

                  const SizedBox(height: 40),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Login"),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text("Create Account"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}