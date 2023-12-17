import 'dart:io';

import 'package:path/path.dart';

class FileHelper {
  static ({
    String fileExtension,
    String fileName,
  }) getFileProperties(String filePath) {
    final File file = File(filePath);
    final fileName = basename(file.path);
    final fileExtension = extension(file.path);
    return (fileName: fileName, fileExtension: fileExtension);
  }

  static Future<String> formatFileSize(String filePath) async {
    final fileSizeInBytes = await File(filePath).length();
    const int KB = 1024;
    const int MB = 1024 * KB;
    const int GB = 1024 * MB;

    if (fileSizeInBytes >= GB) {
      return '${(fileSizeInBytes / GB).toStringAsFixed(2)} GB';
    } else if (fileSizeInBytes >= MB) {
      return '${(fileSizeInBytes / MB).toStringAsFixed(2)} MB';
    } else if (fileSizeInBytes >= KB) {
      return '${(fileSizeInBytes / KB).toStringAsFixed(2)} KB';
    } else {
      return '$fileSizeInBytes bytes';
    }
  }
}
