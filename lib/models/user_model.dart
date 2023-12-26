class UserModel {
  String? id;
  String? username;
  String? email;
  String? phone;

  UserModel({this.id, this.username, this.email, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
