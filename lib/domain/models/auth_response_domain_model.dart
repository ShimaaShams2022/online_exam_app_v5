import 'package:online_exam_app_v5/domain/models/user.dart';

class AuthResponse {
  AuthResponse({
    this.message,
    this.token,
    this.user,});



  String? message;
  String? token;
  User? user;
}