import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';
import 'package:taskaty/utils/helper/bottom_sheet_helper.dart';
import 'package:taskaty/views/screens/task_screen/comps/app_bar_comp_task_screen.dart';
import 'package:taskaty/views/screens/task_screen/comps/files_comp_task_screen.dart';
import 'package:taskaty/views/screens/task_screen/comps/note_comp_task_screen.dart';
import 'package:taskaty/views/screens/task_screen/comps/options_comp_task_screen.dart';
import 'package:taskaty/views/screens/task_screen/comps/title_and_checkbox_comp_task_screen.dart';

import '../../../models/task_model/task_model.dart';
import '../../../routing/routes.dart';
import '../../../utils/constance/dimens.dart';
import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/icons.dart';
import '../../widgets/calendar_widget.dart';
import 'comps/delete_comp_task_screen.dart';

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
    return WillPopScope(
      onWillPop: () async {
        context.taskViewModel.setTask(task);
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBarCompTaskScreen(title: task.title),
        body: Padding(
          padding: padding8,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    gap24,
                    TitleAndCheckboxCompTaskScreen(
                      task: task,
                      titleController: _titleController,
                      onCheckBoxChanged: (value) {
                        task.updateTask(title: _titleController.text);
                      },
                    ),
                    gap16,
                    OptionsCompTaskScreen(
                      task: task,
                      onCalendarButtonClicked: () {
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
                      onRepeatButtonClicked: () {
                        setState(() {
                          task.updateTask(repeatDaily: !task.repeatDaily);
                        });
                      },
                    ),
                    FilesCompTaskScreen(
                      task: task,
                      onAddFilePressed: () async {
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
                      onDeleteButtonPressed: (index) {
                        setState(() {
                          task.files!.removeAt(index);
                          task.updateTask();
                        });
                      },
                    ),
                    gap16,
                    NoteCompTaskScreen(
                      task: task,
                      onNoteBackButtonPressed: () async {
                        await Navigator.pushNamed(context, AppRoutes.noteScreen,
                                arguments: task)
                            .then((value) {
                          setState(() {
                            task = value as TaskModel;
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
              DeleteCompTaskScreen(task: task),
            ],
          ),
        ),
      ),
    );
  }
}
