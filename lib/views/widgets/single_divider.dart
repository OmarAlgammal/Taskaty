import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/constance/dimens.dart';

class SingleDivider extends StatelessWidget {
  const SingleDivider({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.brightGreyColor,
      thickness: size2,
    );
  }
}
