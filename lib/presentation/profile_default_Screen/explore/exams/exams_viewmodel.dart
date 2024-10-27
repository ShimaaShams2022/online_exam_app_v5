
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../data/api/model/response/Exams.dart';
import '../../../../domain/common/api_results.dart';
import '../../../../domain/repository/exams_use_case.dart';

@injectable

class ExamsViewModel extends Cubit<ExamsScreenState>{
  ExamsUseCase examsUseCase;
  //                        start state
  ExamsViewModel(this.examsUseCase):super(ExamsInitialState());


  void exploreExams(String token,String subjectId) async{
    emit(ExamsLoadingState());

    var result = await examsUseCase.invoke(token,subjectId);

    switch (result) {

      case Success<List<Exams>?>():{
        emit(ExamsSuccessState(result.data));
        break;
      }
      case Fail<List<Exams>?>():{
        emit(ExamsErrorState(result.exception));
        break;
      }
    }
  }



}


sealed class ExamsScreenState{}

class ExamsInitialState extends ExamsScreenState{}
class ExamsLoadingState extends ExamsScreenState{}
class ExamsErrorState extends ExamsScreenState{
  Exception? exception;
  ExamsErrorState(this.exception);
}
class ExamsSuccessState extends ExamsScreenState{
  List<Exams>? exams;
  ExamsSuccessState(this.exams);
}



