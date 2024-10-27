import 'package:online_exam_app_v5/data/api/model/response/subject_dto.dart';


import 'Answers.dart';
import 'Exams.dart';


/// answers : [{"answer":"Hyperlinks and Text Markup Language","key":"A1"},{"answer":"Hyper Text Markup Language","key":"A2"},{"answer":"Home Tool Markup Language","key":"A3"}]
/// type : "single_choice"
/// _id : "670082800a5849a4aee16294"
/// question : "What does HTML stand for?"
/// correct : "A2"
/// subject : {"_id":"670037f6728c92b7fdf434fc","name":"HTML","icon":"https://exam.elevateegy.com/uploads/categories/670037f6728c92b7fdf434fa-html-language.png","createdAt":"2024-10-04T18:46:14.281Z"}
/// exam : {"_id":"670070a830a3c3c1944a9c63","title":"HTML Quiz","duration":25,"subject":"670037f6728c92b7fdf434fc","numberOfQuestions":40,"active":true,"createdAt":"2024-10-04T22:48:08.842Z"}
/// createdAt : "2024-10-05T00:04:16.070Z"

class Questions {
  Questions({
      this.answers, 
      this.type, 
      this.id, 
      this.question, 
      this.correct, 
      this.subject, 
      this.exam, 
      this.createdAt,});

  Questions.fromJson(dynamic json) {
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
    type = json['type'];
    id = json['_id'];
    question = json['question'];
    correct = json['correct'];
    subject = json['subject'] != null ? SubjectDto.fromJson(json['subject']) : null;
    exam = json['exam'] != null ? Exams.fromJson(json['exam']) : null;
    createdAt = json['createdAt'];
  }
  List<Answers>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  SubjectDto? subject;
  Exams? exam;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['type'] = type;
    map['_id'] = id;
    map['question'] = question;
    map['correct'] = correct;
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    if (exam != null) {
      map['exam'] = exam?.toJson();
    }
    map['createdAt'] = createdAt;
    return map;
  }

}