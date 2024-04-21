import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:open_file/open_file.dart';
import 'package:taskaty/localization/app_local.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../../../utils/constance/border_radius.dart';
import '../../../../utils/constance/my_padding.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../../utils/helper/file_helper.dart';

class FilesCompTaskScreen extends StatelessWidget {
  const FilesCompTaskScreen(
      {super.key,
      required this.task,
      required this.onAddFilePressed,
      required this.onDeleteButtonPressed});

  final TaskModel task;
  final void Function(int) onDeleteButtonPressed;
  final void Function() onAddFilePressed;

  /*
  void setState(void Function() fn),
  setState(() {
                      task.files!.removeAt(index);
                      task.updateTask();
                    });
   */

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(AppLocal.addFile.getString(context)),
          leading: Icon(
            AppIcons.attachIcon,
          ),
          horizontalTitleGap: 0,
          onTap: onAddFilePressed,
        ),
        Gaps.gap8,
        task.files != null
            ? ListView.builder(
                itemCount: task.files!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => FileItemComp(
                      filePath: task.files![index],
                      onFilePressed: () {
                        OpenFile.open(task.files![index]);
                      },
                      onDeleteButtonPressed: (){
                        onDeleteButtonPressed(index);
                      },
                    ))
            : const SizedBox(),
      ],
    );
  }

  Widget filesList() {
    return task.files != null
        ? ListView.builder(
            itemCount: task.files!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => FileItemComp(
                filePath: task.files![index],
                onFilePressed: () {
                  OpenFile.open(task.files![index]);
                },
                onDeleteButtonPressed: (){
                  onDeleteButtonPressed(index);
                }))
        : const SizedBox();
  }
}

class FileItemComp extends StatelessWidget {
  const FileItemComp(
      {Key? key,
      required this.filePath,
      required this.onFilePressed,
      required this.onDeleteButtonPressed})
      : super(key: key);

  final String filePath;
  final VoidCallback onFilePressed;
  final VoidCallback onDeleteButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilePressed,
      child: Padding(
        padding: MyPadding.paddingV4,
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                  borderRadius: Circular.circular5,
                ),
// file type
                child: Center(
                  child: Text(
                    FileHelper.getFileProperties(filePath).fileExtension,
                  ),
                ),
              ),
              Gaps.gap16,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// file name
                  Text(
                    FileHelper.getFileProperties(filePath).fileName,
                  ),
// file size
                  FutureBuilder(
                    future: FileHelper.formatFileSize(filePath),
                    builder: (context, snapshot) {
                      if (ConnectionState.done == snapshot.connectionState) {
                        return Text(snapshot.data ?? '');
                      }
                      return const Text('loading file size..');
                    },
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: onDeleteButtonPressed,
                  icon: const Icon(AppIcons.deleteIcon))
            ],
          ),
        ),
      ),
    );
  }
}
