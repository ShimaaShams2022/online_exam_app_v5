import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/repository/subjects_repository.dart';
import '../common/api_results.dart';
import '../models/subject.dart';

@injectable

class ExploreUseCase{
  SubjectsRepository allSubjectsRepository;
  ExploreUseCase(this.allSubjectsRepository);

  Future<Result<List<Subject>?>> invoke(){
    return allSubjectsRepository.getAllSubjects() ;
  }
}
