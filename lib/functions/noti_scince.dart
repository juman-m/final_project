import 'dart:developer';

import 'package:final_project/models/notification_model.dart';

notiScince(List<NotificationsModel> list) {
  final today = DateTime.now();
  for (var element in list) {
    final date = element.date;
    Duration calculateDifference = DateTime.parse(date!).difference(today);
    int difference = calculateDifference.inDays;
    log(element.type.toString());
    if (difference == 0) {
      element.time = 'اليوم';
      // الساعات
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
