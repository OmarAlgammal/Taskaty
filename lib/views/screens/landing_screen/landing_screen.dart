import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/screens/register_screen/register_screen.dart';

import '../home_screen/home_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: context.authRepo.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == null) {
          return const RegisterScreen();
        }

        return const HomeScreen();
      },
    );
  }
}
