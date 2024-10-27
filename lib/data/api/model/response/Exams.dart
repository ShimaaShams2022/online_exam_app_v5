/// _id : "670070a830a3c3c1944a9c63"
/// title : "HTML Quiz"
/// duration : 25
/// subject : "670037f6728c92b7fdf434fc"
/// numberOfQuestions : 40
/// active : true
/// createdAt : "2024-10-04T22:48:08.842Z"

class Exams {
  Exams({
      this.id, 
      this.title, 
      this.duration, 
      this.subject, 
      this.numberOfQuestions, 
      this.active, 
      this.createdAt,});

  Exams.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? title;
  num? duration;
  String? subject;
  num? numberOfQuestions;
  bool? active;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['duration'] = duration;
    map['subject'] = subject;
    map['numberOfQuestions'] = numberOfQuestions;
    map['active'] = active;
    map['createdAt'] = createdAt;
    return map;
  }

}