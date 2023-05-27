import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/models/tasks_list_model.dart';
import 'package:taskaty/service_locator/sl.dart';
import 'package:taskaty/util/constance/icons.dart';
import 'package:taskaty/util/extensions/screen_dimens.dart';
import 'package:taskaty/view_model/view_model.dart';
import 'package:taskaty/views/widgets/list_item_selection_design.dart';

class MyAlertDialog extends StatelessWidget {
  MyAlertDialog({Key? key, required this.tasksLists, required this.groupName}) : super(key: key);

  final List<TasksListModel> tasksLists;
  final String groupName;

  final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(false);
  List<TasksListModel> _dialogLists = [];
  List<TaskModel> _tasksToUpdate = [];

  List<TasksListModel> copyTasksLists() {
    return tasksLists.map((e) {
      return e.copyWith(e) as TasksListModel;
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
              sl<ViewModel>()
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
                  mainTask = mainTask.copyWith(groupName: mainTask.groupName != null ? null : groupName);
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
