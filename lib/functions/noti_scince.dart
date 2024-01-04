import 'package:final_project/models/notification_model.dart';

notiScince(List<NotificationsModel> list) {
  final today = DateTime.now();
  list.removeWhere((element) {
    final date = element.date;
    Duration calculateDifference = DateTime.parse(date!).difference(today);
    int difference = calculateDifference.inDays;
    if (element.type == '0') {
      if (difference > 2) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  });
  for (var element in list) {
    final date = element.date;
    Duration calculateDifference = DateTime.parse(date!).difference(today);
    int difference = calculateDifference.inDays;
    if (difference > 0) {
      difference++;
    }
    if (element.type == '0') {
      if (difference <= 2) {
        if (difference == 2) {
          element.time = 'بعد يومين';
          element.content = '${element.content} باقي يومين على موعدك';
          
        } else if (difference == 1) {
          element.time = 'بعد يوم';
          element.content = '${element.content} باقي يوم على موعدك';
          
        } else if (difference == 0) {
          element.time = 'اليوم';
          element.content = '${element.content} موعدك اليوم';
          
        } else if (difference == -1) {
          element.time = 'منذ يوم';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -2) {
          element.time = 'منذ يومين';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -3) {
          element.time = 'منذ 3 ايام';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -4) {
          element.time = 'منذ 4 ايام';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -5) {
          element.time = 'منذ 5 ايام';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -6) {
          element.time = 'منذ 6 ايام';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -7) {
          element.time = 'منذ اسبوع';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference < -7 && difference > -14) {
          element.time = 'منذ اكثر من اسبوع';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -14) {
          element.time = 'منذ اسبوعين';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference < -14 && difference > -21) {
          element.time = 'منذ اكثر من اسبوعين';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -21) {
          element.time = 'منذ 3 اسابيع';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference < -21 && difference > -30) {
          element.time = 'منذ اكثر من 3 اسابيع';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference == -31) {
          element.time = 'منذ شهر';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference < -30 && difference > -60) {
          element.time = 'منذ اكثر من شهر';
          element.content = '${element.content} موعدك اليوم';
        } else if (difference < -60) {
          element.time = 'منذ اشهر';
          element.content = '${element.content} موعدك اليوم';
        }
      }
    } else if (element.type == '1') {
      if (difference == 0) {
        element.time = 'اليوم';
        
      } else if (difference == -1) {
        element.time = 'منذ يوم';
      } else if (difference == -2) {
        element.time = 'منذ يومين';
      } else if (difference == -3) {
        element.time = 'منذ 3 ايام';
      } else if (difference == -4) {
        element.time = 'منذ 4 ايام';
      } else if (difference == -5) {
        element.time = 'منذ 5 ايام';
      } else if (difference == -6) {
        element.time = 'منذ 6 ايام';
      } else if (difference == -7) {
        element.time = 'منذ اسبوع';
      } else if (difference < -7 && difference > -14) {
        element.time = 'منذ اكثر من اسبوع';
      } else if (difference == -14) {
        element.time = 'منذ اسبوعين';
      } else if (difference < -14 && difference > -21) {
        element.time = 'منذ اكثر من اسبوعين';
      } else if (difference == -21) {
        element.time = 'منذ 3 اسابيع';
      } else if (difference < -21 && difference > -30) {
        element.time = 'منذ اكثر من 3 اسابيع';
      } else if (difference == -31) {
        element.time = 'منذ شهر';
      } else if (difference < -30 && difference > -60) {
        element.time = 'منذ اكثر من شهر';
      } else if (difference < -60) {
        element.time = 'منذ اشهر';
      }
    } else {
      if (difference == 0) {
        element.time = 'اليوم';
        
      } else if (difference == -1) {
        element.time = 'منذ يوم';
      } else if (difference == -2) {
        element.time = 'منذ يومين';
      } else if (difference == -3) {
        element.time = 'منذ 3 ايام';
      } else if (difference == -4) {
        element.time = 'منذ 4 ايام';
      } else if (difference == -5) {
        element.time = 'منذ 5 ايام';
      } else if (difference == -6) {
        element.time = 'منذ 6 ايام';
      } else if (difference == -7) {
        element.time = 'منذ اسبوع';
      } else if (difference < -7 && difference > -14) {
        element.time = 'منذ اكثر من اسبوع';
      } else if (difference == -14) {
        element.time = 'منذ اسبوعين';
      } else if (difference < -14 && difference > -21) {
        element.time = 'منذ اكثر من اسبوعين';
      } else if (difference == -21) {
        element.time = 'منذ 3 اسابيع';
      } else if (difference < -21 && difference > -30) {
        element.time = 'منذ اكثر من 3 اسابيع';
      } else if (difference == -31) {
        element.time = 'منذ شهر';
      } else if (difference < -30 && difference > -60) {
        element.time = 'منذ اكثر من شهر';
      } else if (difference < -60) {
        element.time = 'منذ اشهر';
      }
    }
  }
}
