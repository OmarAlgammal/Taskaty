import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';

bottomSheetHelper(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    builder: (context) => child,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
    )
  );
}
