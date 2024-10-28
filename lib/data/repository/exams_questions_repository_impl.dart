
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/data/api/model/response/Questions.dart';
import '../../domain/common/api_results.dart';
import '../../domain/repository/exams_questions_repository.dart';
import '../contracts/subjects/exam_questions_online_data_source.dart';



@Injectable(as: ExamQuestionsRepository)
class ExamQuestionsRepositoryImpl implements ExamQuestionsRepository
{

  ExamQuestionsOnLineDataSource examsQuestionsOnLineDataSource ;


  ExamQuestionsRepositoryImpl(this.examsQuestionsOnLineDataSource);

  @override
  Future<Result<List<Questions>?>> getAllQuestions(String token,String examId) {
 return examsQuestionsOnLineDataSource.getAllQuestions(token,examId);
  }




}