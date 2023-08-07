

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/view_model/tasks_view_model/tasks_view_model.dart';

class NewListTile extends StatefulWidget {
  const NewListTile({Key? key}) : super(key: key);

  @override
  State<NewListTile> createState() => _NewListTileState();
}

class _NewListTileState extends State<NewListTile> {
  bool _addListButtonEnabled = false;
  bool _addGroupButtonEnabled = false;

  final _groupController = TextEditingController();
  final _listController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Padding(
                  padding: paddingH8,
                  child: StatefulBuilder(builder: (context, setState) {
                    return Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            autofocus: true,
                            controller: _listController,
                            onChanged: (text) {
                              setState(() {
                                _addListButtonEnabled =
                                    text.trim().isNotEmpty ? true : false;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'newList'.tr(),
                            ),
                          ),
                        ),
                        gap8,
                        Flexible(
                          flex: 0,
                          child: IconButton(
                            padding: padding0,
                            onPressed: () {
                              if (_listController.text.trim().isNotEmpty) {
                                final task = TaskModel()..listName = _listController.text;
                                locator<ViewModel>().addTask(task);
                                _listController.clear();
                                _addListButtonEnabled = false;
                                Navigator.pop(context);
                              }
                            },
                            icon: Icon(
                              sendIcon,
                              color: _addListButtonEnabled
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              );
            });
      },
      horizontalTitleGap: size0,
      leading: const Icon(
        addNewTaskIcon,
        size: size28,
      ),
      trailing: IconButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    title: Text(
                      'createGroup'.tr(),
                    ),
                    content: TextFormField(
                      controller: _groupController,
                      onChanged: (text) {
                        setState(() {
                          setState(() {
                            _addGroupButtonEnabled =
                            text.trim().isNotEmpty ? true : false;
                          });
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'groupName'.tr(),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (_groupController.text.trim().isNotEmpty) {
                            final task = TaskModel()..groupName = _groupController.text;
                            locator<ViewModel>().addTask(task);
                            _groupController.clear();
                            _addGroupButtonEnabled = false;
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'createGroup'.tr(),
                          style: TextStyle(
                            color: _addGroupButtonEnabled
                                ? Theme.of(context).colorScheme.onPrimary
                                : null,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'cancel'.tr(),
                        ),
                      )
                    ],
                  );
                });
              });
        },
        icon: Icon(groupIcon, color: Theme.of(context).colorScheme.primary,),
      ),
      title: Text(
        'newList'.tr(),
      ),
    );
  }
}
