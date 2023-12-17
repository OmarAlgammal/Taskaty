
import 'package:intl/intl.dart';

extension IntExtensions on int{

  String get getMonthAbbreviatedName =>
      DateFormat('MMM').format(DateTime(DateTime
          .now()
          .year, this));
}