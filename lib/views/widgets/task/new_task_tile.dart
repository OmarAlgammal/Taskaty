import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/localization/app_local.dart';

import '../../../utils/constance/icons.dart';
import '../../../utils/constance/my_padding.dart';
import '../../../utils/constance/paths.dart';

class AddNewTask extends StatelessWidget {
  AddNewTask({Key? key, this.addToMyDayState = false, this.listName})
      : super(key: key);

  final bool addToMyDayState;
  final String? listName;

  bool addedButtonEnabled = false;
  bool repeatDailyState = false;

  final controller = TextEditingController();

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
                  padding: MyPadding.paddingH8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: controller,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: AppLocal.newTask.getString(context),
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
                                if (controller.text.isNotEmpty) {
                                  /// TODO: Complete this action
                                }
                              },
                              contentPadding: MyPadding.padding0,
                              horizontalTitleGap: 0,

                              /// TODO: Replace this icon with svg icon
                              leading: SvgPicture.asset(
                                AppPaths.addTaskIcon,
                                theme: const SvgTheme(
                                    fontSize: 24, currentColor: Colors.red),
                              ),
                              title: Text(
                              AppLocal.addition.getString(context),
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
                              contentPadding: MyPadding.padding0,
                              horizontalTitleGap: 0,
                              leading: Icon(
                                AppIcons.dailyRepetitionIcon,
                                color: repeatDailyButtonColor,
                              ),
                              title: Text(
                              AppLocal.repeatDaily.getString(context),
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
      horizontalTitleGap: 0,
      leading: const Icon(
        AppIcons.addNewTaskIcon,
        size: 28,
      ),
      title: Text(
        AppLocal.newTask.getString(context),
      ),
    );
  }
}
