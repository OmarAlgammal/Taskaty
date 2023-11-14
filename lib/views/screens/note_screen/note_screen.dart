import 'package:flutter/material.dart';

import '../../../models/task_model.dart';
import '../../../service_locator/locator.dart';
import '../../../view_model/tasks_view_model/tasks_view_model_deprecated.dart';

class NotePage extends StatefulWidget {
  NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _controller = TextEditingController();

  late TaskModel task;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    task = ModalRoute.of(context)!.settings.arguments as TaskModel;
  }

  @override
  void deactivate() {
    /// TODO: Remove this line
    //locator<TaskViewModel>().updateTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, task);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            title: SingleChildScrollView(
          child: Text(
            task.title!,
          ),
        )),
        body: TextFormField(
          controller: _controller..text = task.note ?? '',
          autofocus: true,
          expands: true,
          minLines: null,
          maxLines: null,
          onChanged: (description) {
            task.note = description;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Theme.of(context).colorScheme.background,
            filled: true,
          ),
        ),
      ),
    );
  }
}
