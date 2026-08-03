 import 'dart:math';
import 'package:flutter/material.dart';

import 'signup_screen.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController glitchController;

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {

    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter your email and password.",
          ),
        ),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: AnimatedBuilder(

          animation: glitchController,

          builder: (context, child) {

            final movement =
                sin(glitchController.value * pi * 2) * 3;

            return Transform.translate(

              offset: Offset(movement, 0),

              child: SingleChildScrollView(

                padding: const EdgeInsets.all(25),

                child: Column(

                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Text(

                      "H",

                      style: TextStyle(

                        fontSize: 90,

                        fontWeight:
                            FontWeight.w300,

                      ),

                    ),

                    const SizedBox(height: 20),

                    const Text(

                      "Welcome to Hive",

                      style: TextStyle(

                        fontSize: 28,

                        fontWeight:
                            FontWeight.bold,

                      ),

                    ),

                    const SizedBox(height: 40),

                    TextField(

                      controller: emailController,

                      keyboardType:
                          TextInputType.emailAddress,

                      decoration: InputDecoration(

                        hintText: "Email",

                        border: OutlineInputBorder(

                          borderRadius:
                              BorderRadius.circular(20),

                        ),

                      ),

                    ),

                    const SizedBox(height: 15),

                    TextField(

                      controller: passwordController,

                      obscureText: true,

                      decoration: InputDecoration(

                        hintText: "Password",

                        border: OutlineInputBorder(

                          borderRadius:
                              BorderRadius.circular(20),

                        ),

                      ),

                    ),