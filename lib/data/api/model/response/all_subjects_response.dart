import 'package:online_exam_app_v5/data/api/model/response/subject_dto.dart';

import 'meta_data.dart';

class AllSubjectsResponse {
  AllSubjectsResponse({
      this.message, 
      this.metadata, 
      this.subjects,});

  AllSubjectsResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(SubjectDto.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<SubjectDto>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}