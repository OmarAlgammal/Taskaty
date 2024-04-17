import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paymob_payment/paymob_payment.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/paths.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../repositories/remote_service_repos/auth_repo.dart';
import '../../../service_locator/locator.dart';
import '../../../utils/constance/my_padding.dart';
import '../../../utils/constance/icons.dart';
import 'comps/register_comp.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: MyPadding.padding16,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppPaths.appLogo,
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
                    descriptionItemDesign(
                        context: context,
                        title: 'Register and Complete your tasks easily'),
                    descriptionItemDesign(
                        context: context,
                        title: 'Follow your complete tasks'),
                    Gaps.gap36,
                    RegiserComp(
                      icon: AppIcons.googleIcon,
                      registrationText: 'signInWithGoogle',
                      onPressed: () {
                        locator<AuthRepo>().signInWithGoogle();
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
      contentPadding: MyPadding.padding0,
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
