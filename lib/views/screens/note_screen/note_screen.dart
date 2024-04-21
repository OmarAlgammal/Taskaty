import 'package:flutter/material.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../models/task_model/task_model.dart';

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
            task.title,
          ),
        )),
        body: TextFormField(
          controller: _controller..text = task.note ?? '',
          autofocus: true,
          expands: true,
          minLines: null,
          maxLines: null,
          onChanged: (description) {
            task.updateTask(note: description);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: context.colorScheme.background,
            filled: true,
          ),
        ),
      ),
    );
  }
}
