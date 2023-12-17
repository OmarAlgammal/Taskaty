import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/icons.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

void alertDialogHelper(
    {required BuildContext context, required bool paidSuccessfully}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: Circular.circular16,
      ),
      content: Text(paidSuccessfully
          ? 'Payment completed successfully'
          : 'An error occurred, please check the card data'),
      icon: Icon(
        paidSuccessfully ? AppIcons.checkCircle : AppIcons.error,
        color: paidSuccessfully
            ? context.colorScheme.primary
            : context.colorScheme.error,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    ),
  );
}
