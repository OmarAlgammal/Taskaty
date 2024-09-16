import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/routing/routes.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/constance/my_padding.dart';
import 'package:taskaty/utils/constance/paths.dart';
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
            //indicator: UnderlineTabIndicator(borderSide: BorderSide(color: context.colorScheme.onSurface, width: 4)),
            indicatorWeight: 2,
            tabs: context.mainTabs
                .map((e) => FittedBox(child: Text(e, style: context.textTheme.titleMedium,)))
                .toList(),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
