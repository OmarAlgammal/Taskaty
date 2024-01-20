import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/theme/colors.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/constance/paths.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

class HomeScreenTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: null,
      title: SvgPicture.asset(
        AppPaths.appLogo,
        color: Theme.of(context).primaryColor,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.moreScreen);
            },
            icon: const Icon(AppIcons.more)),
      ],
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            padding: padding4,
            indicatorPadding: padding0,
            tabs: MainTabs.values
                .map((e) => Container(
                      child: Padding(
                        padding: padding6,
                        child: Text(e.name),
                      ),
                    ))
                .toList(),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(96);
}
