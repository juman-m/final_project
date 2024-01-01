import 'package:final_project/functions/string_to_time_of_day.dart';
import 'package:flutter/material.dart';

class CommunityModel {
  int? id;
  String? userId;
  String? content;
  String? city;
  TimeOfDay? time;
  String? participantName;

  CommunityModel({
    this.id,
    this.userId,
    this.content,
    this.city,
    this.time,
    this.participantName,
  });

  CommunityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    content = json['content'];
    city = json['city'];
    time = stringToTimeOfDay(json['time']);
    participantName = json['participant_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['content'] = this.content;
    data['city'] = this.city;
    data['time'] = this.time;
    return data;
  }
}
