import 'Metadata.dart';
import 'Exams.dart';

/// message : "success"
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// exams : [{"_id":"670070a830a3c3c1944a9c63","title":"HTML Quiz","duration":25,"subject":"670037f6728c92b7fdf434fc","numberOfQuestions":40,"active":true,"createdAt":"2024-10-04T22:48:08.842Z"}]

class ExamsResponse {
  ExamsResponse({
      this.message, 
      this.metadata, 
      this.exams,});

  ExamsResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['exams'] != null) {
      exams = [];
      json['exams'].forEach((v) {
        exams?.add(Exams.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Exams>? exams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (exams != null) {
      map['exams'] = exams?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}