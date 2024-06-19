import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../../localization/app_local.dart';
import '../../../../utils/constance/border_radius.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';

class RegisterWithGoogleComp extends StatelessWidget {
  const RegisterWithGoogleComp({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.authRepo.signInWithGoogle();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: Circular.circular100,
          color: context.colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                AppIcons.googleIcon,
                size: 28,
              ),
              Gaps.gap16,
              Text(AppLocal.signInWithGoogle.getString(context),
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
      ),
    );
  }
}
