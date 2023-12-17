import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';
import 'package:taskaty/utils/helper/file_helper.dart';

import '../../utils/constance/dimens.dart';
import '../../utils/constance/gaps.dart';

class FileItemDesign extends StatelessWidget {
  const FileItemDesign(
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
        padding: paddingV4,
        child: SizedBox(
          height: size56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size46,
                height: size46,
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
              gap16,
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
