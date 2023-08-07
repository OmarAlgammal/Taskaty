import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/models/group_model.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/models/list_model.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/screen_dimens.dart';
import 'package:taskaty/view_model/tasks_view_model/tasks_view_model.dart';
import 'package:taskaty/views/widgets/group_item_design.dart';
import 'package:taskaty/views/widgets/list_item_selection_design.dart';
import 'package:taskaty/views/widgets/tasks_list_item_design.dart';

/// TODO: Convert it to stateless
class GroupComponent extends StatefulWidget {
  const GroupComponent(
      {Key? key, required this.group, required this.lists})
      : super(key: key);

  final GroupModel group;
  final List<ListModel> lists;

  @override
  State<GroupComponent> createState() => _GroupComponentState();
}

class _GroupComponentState extends State<GroupComponent> {
  late List<ListModel> dialogLists;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: false,
      onExpansionChanged: (bool value) {
        setState(() {
          _isExpanded = value;
        });
      },
      title: ListTile(
        horizontalTitleGap: size0,
        contentPadding: padding0,
        leading: const Icon(
          groupIcon,
        ),
        title:
        // InkWell(
        //   onTap: (){
        //     showDialog(context: context, builder: (context) => AlertDialog(
        //       content: Text('content'),
        //     ));
        //   },
        //   child: Text('omar'),
        // )
        GroupItemDesign(group: widget.group, isExpanded: _isExpanded, tasksLists: widget.lists,),
      ),
      children: widget.group.lists.map((e) => Padding(
        padding: paddingH16,
        child: TasksListItemDesign(
          list: e,
        ),
      )).toList()
    );
  }
}
