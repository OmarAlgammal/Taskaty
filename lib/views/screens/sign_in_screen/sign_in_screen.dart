import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/widgets/task_item_design.dart';

import '../../../databases/auth_database.dart';
import '../../../service_locator/locator.dart';
import '../../../utils/constance/dimens.dart';
import '../../../utils/constance/icons.dart';
import '../../widgets/register_item_design.dart';

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
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/assets/dark_logo.svg',
                      fit: BoxFit.fill,
                      height: context.height * .04,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    descriptionItemDesign(context: context, title: 'Register and Complete your tasks easily'.tr()),
                    descriptionItemDesign(context: context, title: 'Follow your complete tasks'.tr()),
                    gap36,
                    RegisterItemDesign(
                      icon: googleIcon,
                      registrationText: 'signInWithGoogle'.tr(),
                      onPressed: () {
                        locator<AuthDatabase>().signInWithGoogle();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }

  Widget descriptionItemDesign(
      {required BuildContext context, required String title}) {
    return CheckboxListTile(
      value: true,
      enabled: false,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: const CircleBorder(),
      contentPadding: padding0,
      dense: true,
      onChanged: (bool? value) {},
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
      ),
    );
  }
}
