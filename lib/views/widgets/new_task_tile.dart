import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constance/dimens.dart';
import '../../utils/constance/icons.dart';
import '../../utils/constance/paths.dart';

class AddNewTask extends StatelessWidget {
  AddNewTask({Key? key, this.addToMyDayState = false, this.listName})
      : super(key: key);

  final bool addToMyDayState;
  final String? listName;

  final controller = TextEditingController();

  bool addedButtonEnabled = false;
  bool repeatDailyState = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              final repeatDailyButtonColor = repeatDailyState
                  ? Theme.of(context).colorScheme.onPrimary
                  : null;
              final addedButtonColor = addedButtonEnabled
                  ? Theme.of(context).colorScheme.onPrimary
                  : null;
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Padding(
                  padding: paddingH8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
// text from field
                      TextFormField(
                        controller: controller,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'newTask'.tr(),
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            setState(() {
                              addedButtonEnabled = true;
                            });
                          } else {
                            setState(() {
                              addedButtonEnabled = false;
                            });
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: ListTile(
                              onTap: () {
                                if (controller.text.isNotEmpty) {}
                              },
                              contentPadding: padding0,
                              horizontalTitleGap: size0,
// add task Icon
                              /// TODO: Replace this icon with svg icon
                              leading: SvgPicture.asset(
                                addTaskIconPath,
                                theme: SvgTheme(
                                    fontSize: 24, currentColor: Colors.red),
                              ),
// addition text
                              title: Text(
                                'addition'.tr(),
                                style: TextStyle(
                                  color: addedButtonColor,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  repeatDailyState = !repeatDailyState;
                                });
                              },
                              contentPadding: padding0,
                              horizontalTitleGap: size0,
                              leading: Icon(
                                AppIcons.dailyRepetitionIcon,
                                color: repeatDailyButtonColor,
                              ),
                              title: Text(
                                'repeatDaily'.tr(),
                                style: TextStyle(
                                  color: repeatDailyButtonColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
          },
        );
      },
      horizontalTitleGap: size0,
// add new task icon
      leading: const Icon(
        AppIcons.addNewTaskIcon,
        size: size28,
      ),
// add new task text
      title: Text(
        'newTask'.tr(),
      ),
    );
  }
}
