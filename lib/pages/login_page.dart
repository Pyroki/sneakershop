import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakershop/components/my_btn.dart';
import 'package:sneakershop/components/text_field.dart';

import 'package:sneakershop/pages/intro_page.dart';
import 'package:sneakershop/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // Auth login
  void login() async {
    final _authServices = AuthService();
    try {
      await _authServices.signInwithEmailPassword(
        emailController.text,
        passController.text,
      );
      // Navigate to home page if login successful
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IntroPage(),
        ),
      );
    } catch (e) {
      // Show error dialog if login fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 25),
                const Text(
                  "Welcome back to our shopping ",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: "Name",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: passController,
                  hintText: "password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyBtn(
                  onTap: login,
                  text: "sign in",
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a Member?",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
