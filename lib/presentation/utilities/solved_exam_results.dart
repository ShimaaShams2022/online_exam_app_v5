

import '../../data/api/model/response/Questions.dart';
import 'exam_data.dart';

class SolvedExamResults{
  List<Questions>? questions;
  ExamData? examData;
  Map<int, String>? userAnswers;
  int? correctAnswers;
  int? totalQuestions;

  SolvedExamResults({
    required this.examData,
    required this.userAnswers,
  required this.totalQuestions,
  required this.correctAnswers,
    required this.questions,
  });
}