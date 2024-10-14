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

class User {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.token,
  });

  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? token;

}