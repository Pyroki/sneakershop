import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakershop/components/my_btn.dart';
import 'package:sneakershop/components/text_field.dart';
import 'package:sneakershop/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

  void register() async {
    final _authServices = AuthService();

    if (passController.text == confirmpassController.text) {
      try {
        await _authServices.signUpwithEmailPassword(
          emailController.text,
          passController.text,
        );
      } catch (e) {
        // Show error dialog if registration fails
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
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
                  Icons.person_2,
                  size: 50,
                  color: Colors.blue,
                ),
                const SizedBox(height: 25),
                const Text(
                  "Do you want to register",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: passController,
                  hintText: "password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: confirmpassController,
                  hintText: "confirm password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyBtn(
                  onTap: register,
                  text: "sign up",
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a Member?",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "sign in",
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
