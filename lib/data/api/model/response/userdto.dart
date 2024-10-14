import '../../../../domain/models/user.dart';


/// id : "67001692f87c48663aee3ad7"
/// username : "elevate"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin@elevate.com"
/// phone : "01094155711"
/// role : "admin"
/// isVerified : false
/// createdAt : "2024-10-04T16:23:46.337Z"
/// passwordChangedAt : "2024-10-04T16:32:17.670Z"
/// passwordResetCode : "e184483d9fe8ff567770cb6d1f61bbbe4728cb5091ed9dfc34b574757cec6a64"
/// passwordResetExpires : "2024-10-10T00:01:53.167Z"
/// resetCodeVerified : false
/// token : ""

class UserDto {
  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.token,});

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    passwordChangedAt = json['passwordChangedAt'];
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    resetCodeVerified = json['resetCodeVerified'];
    token = json['token'];
  }
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? createdAt;
  String? passwordChangedAt;
  String? passwordResetCode;
  String? passwordResetExpires;
  bool? resetCodeVerified;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    map['passwordChangedAt'] = passwordChangedAt;
    map['passwordResetCode'] = passwordResetCode;
    map['passwordResetExpires'] = passwordResetExpires;
    map['resetCodeVerified'] = resetCodeVerified;
    map['token'] = token;
    return map;
  }
  User toUser(){
    return User(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email:email ,
      phone: phone,
      role: role,
      isVerified: isVerified,
      token: token,
    );
  }
}