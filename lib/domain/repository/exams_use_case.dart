import 'package:injectable/injectable.dart';
import '../../data/api/model/response/Exams.dart';
import '../common/api_results.dart';
import 'exams_repository.dart';

@injectable

class ExamsUseCase{
  ExamsRepository examsRepository;
  ExamsUseCase(this.examsRepository);

  Future<Result<List<Exams>?>> invoke(String token,String subjectId){
    return examsRepository.getAllExamsForSubject(token, subjectId) ;
  }
}
