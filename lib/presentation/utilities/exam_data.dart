import '../../data/api/model/response/Exams.dart';

class ExamData{
  String userToken;
  String subjectName;
  Exams examData;
  ExamData(this.userToken,this.subjectName,this.examData);
}