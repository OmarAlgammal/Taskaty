import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskaty/utils/constance/border_radius.dart';
import 'package:taskaty/utils/constance/dimens.dart';
import 'package:taskaty/utils/constance/gaps.dart';
import 'package:taskaty/utils/extensions/context_extension.dart';

import '../../models/task_model/task_model.dart';

class PeriodItem extends StatelessWidget {
  const PeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sat \n 22/10'),
          gap8,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimary,
                borderRadius: Circular.circular8,
              ),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                  height: 48,
                  child: ListTileTheme(
                    horizontalTitleGap: 0,
                    child: CheckboxListTile(
                      title: Text('title'),
                      contentPadding: padding0,
                      side: BorderSide.none,
                      checkboxShape: const CircleBorder(),
                      tristate: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
