
class ProfileRequest {
  ProfileRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,});

  ProfileRequest.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
  }
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}