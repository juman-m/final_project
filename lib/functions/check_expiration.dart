import 'package:final_project/functions/calculate_time_difference.dart';
import 'package:flutter/material.dart';

bool checkExpiration(String date, TimeOfDay time) {
  Duration difference = DateTime.parse(date).difference(DateTime.now());
  if (difference.inDays >= 0) {
    if (difference.inDays == 0 &&
        calculateTimeDifference(time, TimeOfDay.now()) > 0) {
      return true;
    } else {
      return false;
    }
  } else {
    return true;
  }
}
