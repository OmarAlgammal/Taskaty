import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/constance/dimens.dart';
import '../../../utils/constance/gaps.dart';
import '../../widgets/buttons/my_button.dart';

class SignUpWithEmailScreen extends StatelessWidget {
  SignUpWithEmailScreen({Key? key}) : super(key: key);

  static const String routeName = 'createAccountWithEmailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: padding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'createAccount'.tr(),
                    style: const TextStyle(
                      fontSize: size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      child: Column(
                        children: [
// name field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'name'.tr(),
                            ),
                          ),
// account field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'account'.tr(),
                            ),
                          ),
// password field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'passwordHint'.tr(),
                            ),
                          )
                        ],
                      ),
                    ),
                    gap24,
                    MyButton(
                      onPressed: () {
                        // todo: create account
                      },
                      buttonName: 'createAccount'.tr(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
