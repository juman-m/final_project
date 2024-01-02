class NotificationsModel {
  int? id;
  String? date;
  String? userId;
  String? content;
  String? time;
  int? commentId;
  String? type;

  NotificationsModel(
      {this.id,
      this.date,
      this.userId,
      this.content,
      this.time,
      this.commentId,
      this.type});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    userId = json['user_id'];
    content = json['content'];
    time = json['time'];
    commentId = json['comment_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['content'] = this.content;
    data['time'] = this.time;
    data['comment_id'] = this.commentId;
    data['type'] = this.type;
    return data;
  }
}
