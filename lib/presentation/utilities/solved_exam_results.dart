

import 'exam_data.dart';

class SolvedExamResults{
  ExamData examData;
  Map<int, String>? userAnswers;
  int? correctAnswers;
  int? totalQuestions;
  SolvedExamResults({
    required this.examData,
    required this.userAnswers,
  required this.totalQuestions,
  required this.correctAnswers,
  });
}