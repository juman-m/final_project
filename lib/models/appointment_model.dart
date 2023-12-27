import 'package:final_project/functions/string_to_time_of_day.dart';
import 'package:flutter/material.dart';

class AppointmentModel {
  int? id;
  String? userId;
  String? category;
  String? description;
  String? date;
  TimeOfDay? time;

  AppointmentModel(
      {this.id,
      this.userId,
      this.category,
      this.description,
      this.date,
      this.time});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    category = json['category'];
    description = json['description'];
    date = json['date'];
    time = stringToTimeOfDay(json['time']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category'] = this.category;
    data['description'] = this.description;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
