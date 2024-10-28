/// answer : "Hyperlinks and Text Markup Language"
/// key : "A1"

class Answers {
  Answers({
      this.answer, 
      this.key,});

  Answers.fromJson(dynamic json) {
    answer = json['answer'];
    key = json['key'];
  }
  String? answer;
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    map['key'] = key;
    return map;
  }

}