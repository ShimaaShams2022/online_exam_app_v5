


import 'package:injectable/injectable.dart';
import '../../domain/common/api_results.dart';
import '../../domain/models/subject.dart';
import '../../domain/repository/subjects_repository.dart';
import '../contracts/subjects/subjects_online_data_source.dart';

@Injectable(as: SubjectsRepository)
class SubjectsRepositoryImpl implements SubjectsRepository
{

  SubjectsOnLineDataSource subjectsOnLineDataSource ;


  SubjectsRepositoryImpl(this.subjectsOnLineDataSource);

  @override
  Future<Result<List<Subject>?>> getAllSubjects() {
 return subjectsOnLineDataSource.getAllSubjects();
  }




}