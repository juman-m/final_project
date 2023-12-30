import 'package:flutter/material.dart';

bool checkExpiration(String date, TimeOfDay time) {
  Duration difference = DateTime.parse(date).difference(DateTime.now());
  final todayDate = DateTime.now();
  final today = '${todayDate.year}-${todayDate.month}-${todayDate.day}';
  TimeOfDay now = TimeOfDay.now();
  if (difference.inDays == 0) {
    if (date == today) {
      if (time.hour > now.hour) {
        return false;
      } else if (time.hour == now.hour) {
        if (time.minute >= now.minute) {
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  } else if (difference.inDays > 0) {
    return false;
  } else {
    return true;
  }
}
