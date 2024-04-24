//purpose is to check wheater the user is logged in or not

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sneakershop/pages/intro_page.dart';
import 'package:sneakershop/services/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in

            if (snapshot.hasData) {
              return const IntroPage();
            } else {
              //user is not logged in
              return const LoginOrRegister();
            }
          }),
    );
  }
}
