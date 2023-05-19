import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../databases/auth_database.dart';
import '../../routing/routes.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/gaps.dart';
import '../../util/constance/icons.dart';
import '../widgets/ask_and_make_action.dart';
import '../widgets/register_item_design.dart';

class SignInPage extends StatelessWidget {

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: padding16,
          child: Column(
            children: [
              /// TODO: Remove sign in work and replace it with app logo
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'signIn'.tr(),
                    style: const TextStyle(
                      fontSize: size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RegisterItemDesign(
                      icon: emailIcon,
                      registrationText: 'signInWithEmail'.tr(),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.signUpWithEmailPage);
                      },
                    ),
                    gap16,
                    RegisterItemDesign(
                      icon: googleIcon,
                      registrationText: 'signInWithGoogle'.tr(),
                      onPressed: () {
                        sl<AuthDatabase>().signInWithGoogle();
                      },
                    ),
                    gap16,
                    RegisterItemDesign(
                      icon: appleIcon,
                      registrationText: 'signInWithApple'.tr(),
                      onPressed: () {
                        // todo: sing in with apple account
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.homePage);
                      },
                    ),
                  ],
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AskAndMakeAction(
                        question: 'newUser'.tr(),
                        action: 'createAccount'.tr(),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signUpPage);
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
