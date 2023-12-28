import 'dart:developer';
import 'package:flutter/material.dart';

calculateTimeDifference(TimeOfDay todayTime, TimeOfDay time1) {
  int minutes1 = time1.hour * 60 + time1.minute;
  int todayMinutes = todayTime.hour * 60 + todayTime.minute;
  int differenceInMinutes = (minutes1 - todayMinutes);
 
  return differenceInMinutes;
}
