
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/subject.dart';

import '../../../domain/common/api_results.dart';
import '../../api/api_manager.dart';
import '../../api/model/api_extensions.dart';
import '../../contracts/subjects/subjects_online_data_source.dart';

@Injectable(as:SubjectsOnLineDataSource )
class SubjectsOnLineDataSourceImpl implements SubjectsOnLineDataSource{

  ApiManager apiManager;

  SubjectsOnLineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Subject>?>> getAllSubjects(String token) async {

    return executeApi<List<Subject>?>(() async {
      var allSubjectsResponse = await apiManager.getAllSubjects(token);
      var listSubjectDto = allSubjectsResponse?.subjects;
      print(listSubjectDto?.first.name);
     List<Subject> listOfSubjects=[];
      for(var subjectDto in listSubjectDto!){
        listOfSubjects.add(subjectDto.toSubject());
      }
      return listOfSubjects;
    }
    );
    }




}
