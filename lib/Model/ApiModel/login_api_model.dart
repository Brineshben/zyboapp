class LoginPhoneNumberModel {
  String? otp;
  bool? user;

  LoginPhoneNumberModel({this.otp, this.user});

  LoginPhoneNumberModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['user'] = this.user;
    return data;
  }
}