import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/utils/constance/paths.dart';

import '../../../utils/constance/my_padding.dart';
import 'comps/register_screen_logo_and_description_comp.dart';
import 'comps/register_with_google_comp.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: MyPadding.padding16,
          child: Stack(
            children: [
              SvgPicture.asset(
                AppPaths.backgroundImage,
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      flex: 2, child: RegisterScreenLogoAndDescriptionComp()),
                  Flexible(flex: 1, child: RegisterWithGoogleComp())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
