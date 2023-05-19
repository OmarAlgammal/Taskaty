import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../util/constance/dimens.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: brightGreyColor,
      thickness: size2,
    );
  }
}
