import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/utils/constance/paths.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/views/screens/register_screen/comps/register_with_google_comp.dart';

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
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 42),
              child: RegisterWithGoogleComp(),
            ),
          )
        ],
      ),
    );
  }
}
