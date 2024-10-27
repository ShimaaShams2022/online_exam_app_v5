import 'package:online_exam_app_v5/domain/models/subject.dart';

import '../../data/api/model/response/Exams.dart';
import '../common/api_results.dart';

abstract class ExamsRepository
{
  Future<Result<List<Exams>?>> getAllExamsForSubject (String token,String subjectId);

}