
import 'package:injectable/injectable.dart';
import '../../domain/common/api_results.dart';
import '../../domain/repository/exams_repository.dart';
import '../api/model/response/Exams.dart';
import '../contracts/subjects/exams_online_data_source.dart';


@Injectable(as: ExamsRepository)
class ExamsRepositoryImpl implements ExamsRepository
{

  ExamsOnLineDataSource examsOnLineDataSource ;


  ExamsRepositoryImpl(this.examsOnLineDataSource);

  @override
  Future<Result<List<Exams>?>> getAllExamsForSubject(String token,String subjectId) {
 return examsOnLineDataSource.getAllExamsForSubject(token,subjectId);
  }




}