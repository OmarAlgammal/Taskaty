import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Center(
        child: Text('Coming \n soon',
            style: Theme.of(context).textTheme.headlineMedium),
      )),
    );
  }
}
