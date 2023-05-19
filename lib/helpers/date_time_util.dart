
class DateTimeUtil{

  static bool sameDay(DateTime dateTime1){
    final now = DateTime.now();
    if (dateTime1.year == now.year && dateTime1.month == now.month && dateTime1.day == now.day){
      return true;
    }
    return false;
  }
}