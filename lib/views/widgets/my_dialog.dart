import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/models/list_model.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/view_model/tasks_view_model/tasks_view_model.dart';
import 'package:taskaty/views/widgets/list_item_selection_design.dart';

class MyAlertDialog extends StatelessWidget {
  MyAlertDialog({Key? key, required this.tasksLists, required this.groupName}) : super(key: key);

  final List<ListModel> tasksLists;
  final String groupName;

  final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(false);
  List<ListModel> _dialogLists = [];
  List<TaskModel> _tasksToUpdate = [];

  List<ListModel> copyTasksLists() {
    return tasksLists.map((e) {
      return e.copyWith(e) as ListModel;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
   _dialogLists = copyTasksLists();
    return AlertDialog(
      title: Text(
        'addListToGroup'.tr(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_tasksToUpdate.isNotEmpty) {
              locator<ViewModel>()
                  .updateGroupOfTasks(_tasksToUpdate)
                  .then((value) => Navigator.pop(context));
            }
          },
          child: ValueListenableBuilder<bool>(
            valueListenable: _valueNotifier,
            builder: (context, value, _) {
              return Text(
                'Save'.tr(),
                style: TextStyle(
                  color: _tasksToUpdate.isNotEmpty
                      ? Theme.of(context).colorScheme.onPrimary
                      : null,
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {
            _tasksToUpdate.clear();
            /// TODO: Refactor this
            _dialogLists = copyTasksLists();
            Navigator.pop(context);
          },
          child: Text(
            'Cancel'.tr(),
          ),
        ),
      ],
      content: SizedBox(
        width: (context.width / 6) * 4,
        height: (context.height / 6) * 4,
        child: ListView.builder(
          itemCount: _dialogLists.length,
          itemBuilder: (context, index) {
            return StatefulBuilder(builder: (context, setState) {
              TaskModel mainTask = _dialogLists[index].mainTask;
              if (mainTask.listName == null) {
                return const SizedBox();
              }
              return ListItemSelectionDesign(
                taskListName: mainTask.listName!,
                addListIconState:
                    mainTask.groupName != null ? checkIcon : null,
                onPressed: () {
                  /// TODO: Refactor this method
                  // Update task group name
                  mainTask.groupName = mainTask.groupName != null ? null : groupName;
                  // Check if list is exist before in updated list
                  final taskExist = _tasksToUpdate
                      .where(
                          (element) => element.localId == mainTask.localId)
                      .isEmpty;
                  if (taskExist) {
                    _tasksToUpdate.add(mainTask);
                  }else{
                    _tasksToUpdate.removeWhere((element) => element.localId == mainTask.localId);
                  }
                  setState(() {
                    _dialogLists[index].mainTask = mainTask;
                    _valueNotifier.value = _tasksToUpdate.isNotEmpty;
                  });
                },
              );
            });
          },
        ),
      ),
    );
  }
}
