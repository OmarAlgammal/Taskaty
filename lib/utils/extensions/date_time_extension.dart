
import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime{

  bool atThisDay(){
    final now = DateTime.now();
    if (year == now.year && month == now.month && day == now.day){
      return true;
    }
    return false;
  }

  String formattedDate(){
    return DateFormat('dd/MM/yyyy HH:mm').format(this);
  }
}