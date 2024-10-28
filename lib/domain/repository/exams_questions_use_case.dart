import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/data/api/model/response/Questions.dart';

import '../common/api_results.dart';
import 'exams_questions_repository.dart';


@injectable

class ExamQuestionsUseCase{
  ExamQuestionsRepository examQuestionsRepository;
  ExamQuestionsUseCase(this.examQuestionsRepository);

  Future<Result<List<Questions>?>> invoke(String token,String examId){
    return examQuestionsRepository.getAllQuestions(token, examId) ;
  }
}
