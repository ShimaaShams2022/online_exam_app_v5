
import 'package:online_exam_app_v5/domain/models/subject.dart';
import '../../../domain/common/api_results.dart';


abstract class SubjectsOnLineDataSource {

  Future<Result<List<Subject>?>> getAllSubjects (String token);


}