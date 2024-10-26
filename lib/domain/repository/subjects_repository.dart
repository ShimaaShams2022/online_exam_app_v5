import 'package:online_exam_app_v5/domain/models/subject.dart';

import '../common/api_results.dart';

abstract class SubjectsRepository
{
  Future<Result<List<Subject>?>> getAllSubjects ();

}