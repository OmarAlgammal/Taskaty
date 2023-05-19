import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/task_model/task_model.dart';
import '../../service_locator/sl.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/gaps.dart';
import '../../util/constance/icons.dart';
import '../../util/constance/paths.dart';
import '../../view_model/view_model.dart';

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
                                final task = TaskModel(
                                    localId: DateTime.now().toString(),
                                    listName: _listController.text,
                                    dateCreated: DateTime.now(),
                                    modificationDate: DateTime.now());
                                sl<ViewModel>().createTask(task);
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
      trailing: GestureDetector(
        onTap: () {
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
                            final task = TaskModel(
                              localId: DateTime.now().toString(),
                              groupName: _groupController.text,
                              dateCreated: DateTime.now(),
                              modificationDate: DateTime.now(),
                            );
                            sl<ViewModel>().createTask(task);
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
          // showDialog(
          //     context: context,
          //     builder: (context){
          //       return AlertDialog(
          //           title: Text(
          //             al.addListToGroup,
          //           ),
          //           content: SizedBox(
          //             width: (context.width /6) *4,
          //             height: (context.height /6) *4,
          //             child: ListView.builder(
          //               itemCount: 6,
          //               itemBuilder: (context, index){
          //                 return const ListItemSelectionDesign(taskListName: 'taskListName');
          //               },
          //             ),
          //           )
          //       );
          //     }
          // );
        },
        child: SvgPicture.asset(
          groupIconPath,
          theme: SvgTheme(currentColor: Theme.of(context).colorScheme.primary),
        ),
      ),
      title: Text(
        'newList'.tr(),
      ),
    );
  }
}
