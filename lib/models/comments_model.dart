import 'package:final_project/functions/string_to_time_of_day.dart';
import 'package:flutter/material.dart';

class CommentModel {
  int? id;
  String? communityParticipantId;
  String? participantName;
  String? content;
  TimeOfDay? time;
  int? communityId;

  CommentModel(
      {this.id,
      this.communityParticipantId,
      this.participantName,
      this.content,
      this.time,
      this.communityId});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    communityParticipantId = json['community_participant_id'];
    participantName = json['participant_name'];
    content = json['content'];
    time = stringToTimeOfDay(json['time']);
    communityId = json['community_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['community_participant_id'] = this.communityParticipantId;
    data['participant_name'] = this.participantName;
    data['content'] = this.content;
    data['time'] = this.time;
    data['community_id'] = this.communityId;
    return data;
  }
}
