class UserDetailsModel {
  Token? token;
  String? userId;
  String? message;

  UserDetailsModel({this.token, this.userId, this.message});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    userId = json['user_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['user_id'] = this.userId;
    data['message'] = this.message;
    return data;
  }
}

class Token {
  String? access;

  Token({this.access});

  Token.fromJson(Map<String, dynamic> json) {
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access'] = this.access;
    return data;
  }
}