import 'package:flutter/material.dart';
import 'package:taskaty/views/widgets/task_item_design.dart';

import '../../models/task_model/task_model.dart';

class CompletedListItemDesign extends StatelessWidget {
  const CompletedListItemDesign(
      {Key? key, required this.expanded, required this.title})
      : super(key: key);

  final bool expanded;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
      ),
      children: [
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            // todo: wrap with bloc
            return TaskItemDesign(
              task: TaskModel(
                  localId: DateTime.now().toString(),
                  title: 'pray',
                  completed: true,
                  addedToMyDay: true,
                  repeatDaily: true,
                  note: 'it is a note',
                  dateCreated: DateTime.now(),
                  modificationDate: DateTime.now()),
            );
          },
        )
      ],
    );
  }
}
