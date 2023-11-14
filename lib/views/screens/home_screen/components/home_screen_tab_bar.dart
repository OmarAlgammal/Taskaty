import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/enums/main_tabs_enum.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

class HomeScreenTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(size86),
          child: TabBar(
            physics: NeverScrollableScrollPhysics(),
            padding: padding4,
            indicatorPadding: padding0,
            indicator: BoxDecoration(
              borderRadius: Circular.circular8,
              color: context.colorScheme.onPrimary,
            ),
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
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(size56);
}
