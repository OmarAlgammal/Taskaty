import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../models/task_model.dart';
import '../../../routing/routes.dart';
import '../../../service_locator/locator.dart';
import '../../../utils/constance/dimens.dart';
import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/icons.dart';
import '../../../view_model/tasks_view_model/use_cases/task_view_model.dart';
import '../../widgets/editable_task_item_design.dart';
import '../../widgets/task_option_item_design.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TaskModel originalTask;
  late TaskModel updatedTask;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    originalTask = ModalRoute.of(context)!.settings.arguments as TaskModel;
    updatedTask = originalTask;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (originalTask != updatedTask) {
          /// TODO: Remove this line
          locator<TaskViewModel>().writeTask(updatedTask);
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            updatedTask.title,
          ),
        ),
        body: Padding(
          padding: padding8,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    gap24,
                    EditableTaskItem(
                        title: updatedTask.title,
                        completedTask: updatedTask.completed,
                        onTitleChanged: (String? text) {
                          setState(() {
                            if (text != null || text!.trim().isNotEmpty) {
                              updatedTask.title = text;
                            }
                          });
                        },
                        onCheckChanged: (bool? value) {
                          setState(() {
                            updatedTask.completed = !updatedTask.completed;
                          });
                        }),
                    gap16,
                    TaskOptionItemDesign(
                        icon: AppIcons.dayIcon,
                        optionName: 'addToMyDay'.tr(),
                        optionState: true,
                        onPressed: () {
                          setState(() {});
                        }),
                    TaskOptionItemDesign(
                        icon: AppIcons.dailyRepetitionIcon,
                        optionName: 'repeatDaily'.tr(),
                        optionState: updatedTask.repeatDaily,
                        onPressed: () {
                          setState(() {
                            updatedTask.repeatDaily = !updatedTask.repeatDaily;
                          });
                        }),
                    // TaskOptionItemDesign(
                    //     icon: attachIcon,
                    //     optionName: 'addFile'.tr(),
                    //     onPressed: () async {
                    //       // dynamic result = await FilePicker.platform.pickFiles();
                    //       // if (result != null) {
                    //       //   setState(() {
                    //       //     result = result.files.map((e) => e.path).toList();
                    //       //     updatedTask = updatedTask
                    //       //         .copyWith(files: [...updatedTask.files, ...result]);
                    //       //   });
                    //       // }
                    //     }),
                    //gap8,
// files list view

                    gap16,
                    TaskOptionItemDesign(
                        icon: AppIcons.addNewTaskIcon,
                        optionName: 'addANote'.tr(),
                        onPressed: () async {
                          updatedTask = await Navigator.pushNamed(
                              context, AppRoutes.noteScreen,
                              arguments: updatedTask) as TaskModel;
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 46,
                child: ListTile(
                  contentPadding: padding0,
                  leading: IconButton(
                    onPressed: () {
                      /// TODO: Create a dialog to make user confirm this action
                      // locator<TaskViewModel>()
                      //     .deleteTask(originalTask)
                      //     .then((value) => Navigator.pop(context));
                    },
                    icon: const Icon(AppIcons.deleteIcon),
                  ),
                  title: Text('originalTask.dateCreated'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
