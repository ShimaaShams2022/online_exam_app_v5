
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/data/api/model/response/Questions.dart';

import '../../../domain/common/api_results.dart';
import '../../api/api_manager.dart';
import '../../api/model/api_extensions.dart';

import '../../contracts/subjects/exam_questions_online_data_source.dart';


@Injectable(as: ExamQuestionsOnLineDataSource)
class ExamQuestionsOnLineDataSourceImpl implements ExamQuestionsOnLineDataSource {
  ApiManager apiManager;

  ExamQuestionsOnLineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Questions>?>> getAllQuestions(
      String token, String examId) async {
    return executeApi<List<Questions>?>(() async {
      var examQuestionsResponse =
          await apiManager.getAllQuestions(token, examId);
      var listOfQuestions = examQuestionsResponse?.questions;
      return listOfQuestions;
    });
  }
}
