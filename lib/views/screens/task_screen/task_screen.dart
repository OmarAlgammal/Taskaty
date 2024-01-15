import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/utils/helper/bottom_sheet_helper.dart';
import 'package:taskaty/utils/helper/date_helper.dart';
import 'package:taskaty/views/widgets/file_item_design.dart';

import '../../../models/task_model/task_model.dart';
import '../../../routing/routes.dart';
import '../../../utils/constance/dimens.dart';
import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/icons.dart';
import '../../widgets/calendar_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TaskModel task;

  DateTime? _dueDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    task = ModalRoute.of(context)!.settings.arguments as TaskModel;
  }

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dueDateColor = task.dueDate != null
        ? DateHelper.dueDateColor(context, task.dueDate!)
        : null;
    final repeatDailyColor =
        task.repeatDaily ? context.colorScheme.onPrimary : null;
    return WillPopScope(
      onWillPop: () async {
        debugPrint('will pop scope : ${task.title}');
        context.taskViewModel.setTask(task);
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            task.title,
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
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 2,
                            controller: _titleController..text = task.title,
                            onChanged: (value) {
                              task.updateTask(
                                  title: _titleController.text);
                            },
                            style: const TextStyle(
                              fontSize: size24,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        gap16,
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              value: task.completed,
                              activeColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              shape: const CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  task.updateTask(completed: value);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    gap16,
                    if (task.dueDate != null)
                      ListTile(
                        title: Text(
                          task.dueDate != null ? task.dueDate!.dateZone : '',
                          style: TextStyle(color: dueDateColor),
                        ),
                        leading: Icon(
                          AppIcons.calendar,
                          color: dueDateColor,
                        ),
                        horizontalTitleGap: 0,
                        onTap: () {
                          bottomSheetHelper(
                            context,
                            CalendarWidget(
                                dueDate: _dueDate,
                                onValueChanged: (value) {
                                  _dueDate = value.first;
                                },
                                onDoneButtonPressed: () {
                                  setState(() {
                                    task.updateTask(dueDate: _dueDate);
                                    Navigator.pop(context);
                                  });
                                }),
                          );
                        },
                      ),
                    ListTile(
                      title: Text(
                        'Repeat daily',
                        style: TextStyle(color: repeatDailyColor),
                      ),
                      leading: Icon(
                        AppIcons.dailyRepetitionIcon,
                        color: repeatDailyColor,
                      ),
                      horizontalTitleGap: 0,
                      onTap: () {
                        setState(() {
                           task.updateTask(repeatDaily: !task.repeatDaily);
                        });
                      },
                    ),
                    ListTile(
                      title: Text('Add file'),
                      leading: Icon(
                        AppIcons.attachIcon,
                      ),
                      horizontalTitleGap: 0,
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        if (result != null) {
                          setState(() {
                            final filesPaths =
                                result.files.map((e) => e.path!).toList();
                            task.updateTask(
                                files: [...task.files ?? [], ...filesPaths]);
                          });
                        }
                      },
                    ),
                    gap8,
                    filesList(),
                    gap16,
                    ListTile(
                      title: Text('Add a note'),
                      leading: Icon(AppIcons.addIcon),
                      horizontalTitleGap: 0,
                      onTap: () async {
                        await Navigator.pushNamed(context, AppRoutes.noteScreen,
                                arguments: task)
                            .then((value) {
                          setState(() {
                            task = value as TaskModel;
                          });
                        });
                      },
                    ),
                    Text(task.note ?? ''),
                  ],
                ),
              ),
              SizedBox(
                height: 46,
                child: ListTile(
                  contentPadding: padding0,
                  onTap: () {
                    context.taskViewModel.deleteTask(task.id).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  leading: const Icon(AppIcons.deleteIcon),
                  title: Text(
                    task.creationDate.dateZone,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget filesList() {
    return task.files != null
        ? ListView.builder(
            itemCount: task.files!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => FileItemDesign(
                  filePath: task.files![index],
                  onFilePressed: () {
                    OpenFile.open(task.files![index]);
                  },
                  onDeleteButtonPressed: () {
                    setState(() {
                      task.files!.removeAt(index);
                      task.updateTask();
                    });
                  },
                ))
        : const SizedBox();
  }
}
