import '../../domain/models/user.dart';

class UserWithToken{
  String? token;
  User? user;
  UserWithToken({required this.user,required this.token});
}