import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../models/task_model/task_model.dart';
import '../../routing/routes.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/gaps.dart';
import '../../util/constance/icons.dart';
import '../../view_model/view_model.dart';
import '../widgets/editable_task_item_design.dart';
import '../widgets/file_item_design.dart';
import '../widgets/task_option_item_design.dart';

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
          updateTask();
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            updatedTask.title!,
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
                        title: updatedTask.title!,
                        completedTask: updatedTask.completed,
                        onTitleChanged: (String? text) {
                          setState(() {
                            if (text != null || text!.trim().isNotEmpty) {
                              updatedTask = updatedTask.copyWith(title: text);
                            }
                          });
                        },
                        onCheckChanged: (bool? value) {
                          setState(() {
                            updatedTask = updatedTask.copyWith(
                                completed: !updatedTask.completed);
                          });
                        }),
                    gap16,
                    TaskOptionItemDesign(
                        icon: dayIcon,
                        optionName: 'addToMyDay'.tr(),
                        optionState: updatedTask.addedToMyDay,
                        onPressed: () {
                          setState(() {
                            updatedTask = updatedTask.copyWith(
                                addedToMyDay: !updatedTask.addedToMyDay);
                          });
                        }),
                    TaskOptionItemDesign(
                        icon: dailyRepetitionIcon,
                        optionName: 'repeatDaily'.tr(),
                        optionState: updatedTask.repeatDaily,
                        onPressed: () {
                          setState(() {
                            updatedTask = updatedTask.copyWith(
                                repeatDaily: !updatedTask.repeatDaily);
                          });
                        }),
                    TaskOptionItemDesign(
                        icon: attachIcon,
                        optionName: 'addFile'.tr(),
                        onPressed: () async {
                          // dynamic result = await FilePicker.platform.pickFiles();
                          // if (result != null) {
                          //   setState(() {
                          //     result = result.files.map((e) => e.path).toList();
                          //     updatedTask = updatedTask
                          //         .copyWith(files: [...updatedTask.files, ...result]);
                          //   });
                          // }
                        }),
                    gap8,
// files list view
                    if (updatedTask.files != null &&
                        updatedTask.files!.isNotEmpty)
                      ListView.builder(
                        itemCount: updatedTask.files!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final filePath = updatedTask.files![index];
                          return SizedBox();
                          // return FileItemDesign(
                          //   fileType: path.extension(filePath),
                          //   fileName: path.basename(filePath),
                          //   fileSize: 1.8,
                          //   onPressed: () {
                          //     ///TODO: Open file
                          //   },
                          // );
                        },
                      ),
                    gap16,
                    TaskOptionItemDesign(
                        icon: addNewTaskIcon,
                        optionName: 'addANote'.tr(),
                        onPressed: () async {
                          updatedTask = await Navigator.pushNamed(
                              context, AppRoutes.notePage,
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
                      sl<ViewModel>()
                          .deleteTask(originalTask)
                          .then((value) => Navigator.pop(context));
                    },
                    icon: const Icon(deleteIcon),
                  ),
                  title: Text(originalTask.dateCreated.toString()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateTask() {
    sl<ViewModel>().updateTask(updatedTask);
  }
}
