
import 'package:injectable/injectable.dart';

import '../../../domain/common/api_results.dart';
import '../../api/api_manager.dart';
import '../../api/model/api_extensions.dart';
import '../../api/model/response/Exams.dart';
import '../../contracts/subjects/exams_online_data_source.dart';

@Injectable(as: ExamsOnLineDataSource)
class ExamsOnLineDataSourceImpl implements ExamsOnLineDataSource {
  ApiManager apiManager;

  ExamsOnLineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Exams>?>> getAllExamsForSubject(
      String token, String subjectId) async {
    return executeApi<List<Exams>?>(() async {
      var allExamsResponse =
          await apiManager.getAllExamsForSubject(token, subjectId);
      var listOfExams = allExamsResponse?.exams;
      return listOfExams;
    });
  }
}
