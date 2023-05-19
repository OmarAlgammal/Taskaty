import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/group_lists_model.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/paths.dart';
import 'tasks_list_item_design.dart';

class GroupItemDesign extends StatefulWidget {
  const GroupItemDesign({Key? key, required this.group}) : super(key: key);

  final GroupListsModel group;

  @override
  State<GroupItemDesign> createState() => _GroupItemDesignState();
}

class _GroupItemDesignState extends State<GroupItemDesign> {
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
        leading: SvgPicture.asset(
          groupIconPath,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.group.name,
              ),
            ),
            Visibility(
                visible: _isExpanded,
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        // todo: addition or removal lists action
                      },
                      child: Text(
                        'additionOrRemovalLists'.tr(),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        // todo: rename group action
                      },
                      child: Text(
                        'renameGroup'.tr(),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        // todo: ungroup list action
                      },
                      child: Text(
                        '_al.ungroupLists',
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.group.lists?.length,
          itemBuilder: (context, index) {
            final task = widget.group.lists![index];
            return task.name != null
                ? Padding(
                    padding: paddingH16,
                    child: TasksListItemDesign(
                      tasksList: widget.group.lists![index],
                    ),
                  )
                : const SizedBox();
          },
        )
      ],
    );
  }
}
