import 'package:online_exam_app_v5/data/api/model/response/Questions.dart';

import '../common/api_results.dart';

abstract class ExamQuestionsRepository
{
  Future<Result<List<Questions>?>> getAllQuestions (String token,String examId);

}