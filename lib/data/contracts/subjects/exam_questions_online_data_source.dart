

import 'package:online_exam_app_v5/data/api/model/response/Exams.dart';
import 'package:online_exam_app_v5/data/api/model/response/Questions.dart';

import '../../../domain/common/api_results.dart';


abstract class ExamQuestionsOnLineDataSource {

  Future<Result<List<Questions>?>> getAllQuestions (String token,String examId);


}