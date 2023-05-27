import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/models/group_lists_model.dart';
import 'package:taskaty/models/tasks_list_model.dart';
import 'package:taskaty/service_locator/sl.dart';
import 'package:taskaty/util/constance/icons.dart';
import 'package:taskaty/util/extensions/screen_dimens.dart';
import 'package:taskaty/view_model/view_model.dart';
import 'package:taskaty/views/widgets/list_item_selection_design.dart';
import 'package:taskaty/views/widgets/my_dialog.dart';

class GroupItemDesign extends StatelessWidget {
  const GroupItemDesign(
      {Key? key,
      required this.group,
      required this.tasksLists,
      required this.isExpanded})
      : super(key: key);

  final GroupListsModel group;
  final List<TasksListModel> tasksLists;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            group.mainTask.groupName!,
          ),
        ),
        Visibility(
          visible: isExpanded,
          child: PopupMenuButton(
            enabled: true,
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  /// TODO: Replace Future.delayed() with enums in onSelect() on popupMenuButton
                  Future.delayed(
                    const Duration(seconds: 0),
                    () => showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return MyAlertDialog(tasksLists: tasksLists, groupName: group.mainTask.groupName!,);
                      },
                    ),
                  );
                },
                /// NOTE: this expression widget.lists.length > 1 ? true : false, to ensure that there are lists other than Tasks list
                enabled: tasksLists.length > 1 ? true : false,
                child: Text(
                  'additionOrRemovalLists'.tr(),
                  style: TextStyle(
                    color: tasksLists.length > 1
                        ? null
                        : Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  // todo: rename group action
                },
                child: Text(
                  'renameGroup'.tr(),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  for (final list in group.lists) {
                    list.mainTask = list.mainTask.copyWith(groupName: null);
                    sl<ViewModel>().updateTask(list.mainTask);
                  }
                  sl<ViewModel>().deleteTask(group.mainTask);
                },
                child: Text(
                  'ungroupLists'.tr(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
