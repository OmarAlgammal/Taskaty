import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../databases/auth_database.dart';
import '../../routing/routes.dart';
import '../../service_locator/locator.dart';
import '../../utils/constance/dimens.dart';
import '../../utils/constance/gaps.dart';
import '../../utils/constance/icons.dart';
import '../widgets/ask_and_make_action.dart';
import '../widgets/register_item_design.dart';

class SignInScreen extends StatelessWidget {

  const SignInScreen({Key? key}) : super(key: key);

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
                child: RegisterItemDesign(
                  icon: googleIcon,
                  registrationText: 'signInWithGoogle'.tr(),
                  onPressed: () {
                    locator<AuthDatabase>().signInWithGoogle();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
