import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../utils/constance/dimens.dart';
import '../../utils/constance/gaps.dart';
import '../../utils/constance/icons.dart';
import '../widgets/ask_and_make_action.dart';
import '../widgets/my_button.dart';

class SignInWithAccountPage extends StatelessWidget {
  SignInWithAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: padding16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'welcomeBack'.tr(),
                    style: const TextStyle(
                      fontSize: size36,
                    ),
                  ),
                  Text(
                    'manyTasksAwaitYouToAchieve'.tr(),
                    style: const TextStyle(
                      fontSize: size18,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                    hintText: 'account'.tr(),
                    prefixIcon: const Icon(
                      emailIcon,
                    ),
                  )),
                  TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'passwordHint'.tr(),
                        prefixIcon: const Icon(
                          eyeIcon,
                        ),
                      )),
                  gap36,
                  MyButton(
                    onPressed: () {
                      // todo: complete verification from account
                    },
                    buttonName: 'al.verification',
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AskAndMakeAction(
                    question: 'al.newUser',
                    action: 'al.createAccount',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.signUpScreen);
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
