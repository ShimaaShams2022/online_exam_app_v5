
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/data/api/model/response/Questions.dart';
import '../../../../domain/common/api_results.dart';
import '../../../../domain/repository/exams_questions_use_case.dart';


@injectable

class ExamQuestionsViewModel extends Cubit<ExamQuestionsScreenState>{
  ExamQuestionsUseCase examQuestionsUseCase;
  //                        start state
  ExamQuestionsViewModel(this.examQuestionsUseCase):super(ExamQuestionsInitialState());


  void exploreQuestions(String token,String examId) async{
    emit(ExamQuestionsLoadingState());

    var result = await examQuestionsUseCase.invoke(token,examId);

    switch (result) {

      case Success<List<Questions>?>():{
        emit(ExamQuestionsSuccessState(result.data));
        break;
      }
      case Fail<List<Questions>?>():{
        emit(ExamQuestionsErrorState(result.exception));
        break;
      }
    }
  }



}


sealed class ExamQuestionsScreenState{}

class ExamQuestionsInitialState extends ExamQuestionsScreenState{}
class ExamQuestionsLoadingState extends ExamQuestionsScreenState{}
class ExamQuestionsErrorState extends ExamQuestionsScreenState{
  Exception? exception;
  ExamQuestionsErrorState(this.exception);
}
class ExamQuestionsSuccessState extends ExamQuestionsScreenState{
  List<Questions>? questions;
  ExamQuestionsSuccessState(this.questions);
}



