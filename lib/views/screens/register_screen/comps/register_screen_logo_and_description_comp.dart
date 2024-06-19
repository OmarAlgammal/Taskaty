import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../../localization/app_local.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/paths.dart';

class RegisterScreenLogoAndDescriptionComp extends StatelessWidget {
  const RegisterScreenLogoAndDescriptionComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppPaths.appLogo,
          fit: BoxFit.fill,
          height: context.height * .04,
        ),
        Gaps.gap24,
        Expanded(child: Text(AppLocal.appDescription.getString(context), style:
        context.textTheme.titleMedium,
          textAlign: TextAlign.center,)),
      ],
    );
  }
}
