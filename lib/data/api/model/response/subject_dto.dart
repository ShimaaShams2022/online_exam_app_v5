

import '../../../../domain/models/subject.dart';

class SubjectDto {
  SubjectDto({
      this.id, 
      this.name, 
      this.icon, 
      this.createdAt,});

  SubjectDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? name;
  String? icon;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }

  Subject toSubject() {
    return Subject(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }

}