import 'package:flutter/material.dart';

import '../../../service_locator/locator.dart';
import '../../../services/firebase_auth.dart';
import '../home_screen/home_screen.dart';
import '../sign_in_screen/sign_in_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: locator<AuthServices>().authStateChanges(),
      builder: (context, snapshot) {
        debugPrint('snapshot here is ${snapshot.data?.email} \n ${snapshot.connectionState}');
        if ([ConnectionState.active, ConnectionState.done]
            .contains(snapshot.connectionState)) {
          if (snapshot.data != null) {
            return const HomeScreen();
          }
          return const SignInScreen();
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
