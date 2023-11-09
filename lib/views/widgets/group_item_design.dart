import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/models/group_model.dart';
import 'package:taskaty/models/list_model.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/view_model/tasks_view_model/tasks_view_model.dart';
import 'package:taskaty/views/widgets/list_item_selection_design.dart';
import 'package:taskaty/views/widgets/my_dialog.dart';

class GroupItemDesign extends StatelessWidget {
  const GroupItemDesign(
      {Key? key,
      required this.group,
      required this.tasksLists,
      required this.isExpanded})
      : super(key: key);

  final GroupModel group;
  final List<ListModel> tasksLists;
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
                enabled: tasksLists.isNotEmpty,
                child: Text(
                  'additionOrRemovalLists'.tr(),
                  style: TextStyle(
                    color: tasksLists.isNotEmpty
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
                    list.mainTask.groupName = null;
                    locator<ViewModel>().updateTask(list.mainTask);
                  }
                  locator<ViewModel>().deleteTask(group.mainTask);
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
