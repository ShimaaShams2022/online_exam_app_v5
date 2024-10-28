

import 'package:online_exam_app_v5/data/api/model/response/Exams.dart';

import '../../../domain/common/api_results.dart';


abstract class ExamsOnLineDataSource {

  Future<Result<List<Exams>?>> getAllExamsForSubject (String token,String subjectId);


}