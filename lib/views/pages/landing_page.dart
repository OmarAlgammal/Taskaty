import 'package:flutter/material.dart';

import '../../service_locator/sl.dart';
import '../../services/firebase_auth.dart';
import 'home_page.dart';
import 'sign_in_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<AuthServices>().authStateChanges(),
      builder: (context, snapshot) {
        if ([ConnectionState.active, ConnectionState.done]
            .contains(snapshot.connectionState)) {
          if (snapshot.data != null) {
            return HomePage();
          }
          return SignInPage();
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
