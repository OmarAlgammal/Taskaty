import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../util/constance/dimens.dart';
import '../../util/constance/gaps.dart';

class FileItemDesign extends StatelessWidget {
  const FileItemDesign(
      {Key? key,
      required this.fileType,
      required this.fileName,
      required this.fileSize,
      required this.onPressed})
      : super(key: key);

  final String fileType;
  final String fileName;
  final double fileSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
                decoration: const BoxDecoration(
                  color: greenColor,
                  borderRadius: circular5,
                ),
// file type
                child: Center(
                  child: Text(
                    fileType,
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
                    fileName,
                  ),
// file size
                  Text(
                    '$fileSize MB',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
