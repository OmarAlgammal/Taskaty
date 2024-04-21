import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/constance/paths.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../repositories/remote_service_repos/auth_repo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: SvgPicture.asset(
              AppPaths.appLogo,
              color: context.colorScheme.onPrimary,
              height: 46,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 42),
              child: Column(
                children: [
                  descriptionWidget(
                    context,
                    text: AppLocal.welcome.getString(context),
                  ),
                  descriptionWidget(
                    context,
                    text: AppLocal.featureDescription1.getString(context),
                  ),
                  descriptionWidget(
                    context,
                    text: AppLocal.featureDescription2.getString(context),
                    textColor: Colors.yellow.shade800,
                  ),
                  descriptionWidget(
                    context,
                    text: AppLocal.featureDescription3.getString(context),
                    textColor: context.colorScheme.onPrimary,
                  ),
                  Gaps.gap36,
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      registerButton(context, primary: false, text: AppLocal.skip.getString(context),
                          onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.homeScreen);
                      }),
                      Gaps.gap16,
                      registerButton(context,
                          text: AppLocal.register.getString(context),
                          icon: AppIcons.googleIcon, onPressed: () {
                        locator<AuthRepo>().signInWithGoogle().then((value) {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.paymentScreen);
                        });
                      })
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget descriptionWidget(
    BuildContext context, {
    required String text,
    Color? textColor,
  }) =>
      ListTile(
        title: Text(text,
            style: context.textTheme.titleMedium!.copyWith(
              color: textColor,
            )),
        leading: Icon(
          AppIcons.filledCircle,
          color: context.colorScheme.onPrimary,
        ),
      );

  Widget registerButton(BuildContext context,
      {bool primary = true,
      required String text,
      IconData? icon,
      required VoidCallback onPressed}) {
    return Expanded(
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: primary ? context.colorScheme.onPrimary : null,
        hoverElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: Circular.circular12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(icon),
              ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
