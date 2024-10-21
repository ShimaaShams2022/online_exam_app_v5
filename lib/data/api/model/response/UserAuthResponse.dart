import 'User.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MTYwM2VkYjBkMjVmODlmZTk4ZDhkMiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI5NTA4ODE0fQ.Zj8C1F9wf9YGSbcVdOkOECVBdiixdpNN12WFDU4Pt7A"
/// user : {"_id":"671603edb0d25f89fe98d8d2","username":"elevate115","firstName":"Elevate","lastName":"Tech","email":"admin5@1elevate.com","phone":"01094155711","role":"user","isVerified":false,"createdAt":"2024-10-21T07:34:05.955Z","passwordResetCode":"e7b58760aa025bc603df2cabc358c6f29c3f31f364e146f792facbd2ecb9a70d","passwordResetExpires":"2024-10-21T07:44:29.100Z","resetCodeVerified":false}

class UserAuthResponse {
  UserAuthResponse({
      this.message, 
      this.token, 
      this.user,});

  UserAuthResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}