
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/subject.dart';
import 'package:online_exam_app_v5/domain/repository/explore_use_case.dart';

import '../../../domain/common/api_results.dart';


@injectable
class ExploreViewModel extends Cubit<ExploreScreenState>{
  ExploreUseCase exploreUseCase;
  //                        start state
  ExploreViewModel(this.exploreUseCase):super(ExploreInitialState());

  void doIntent(ExploreScreenIntent intent){

    switch (intent) {

      case ExploreIntent():_Explore(intent);

    }
  }
  void _Explore(ExploreIntent intent) async{
    emit(ExploreLoadingState());

    var result = await exploreUseCase.invoke();
    switch (result) {

      case Success<List<Subject>?>():{
        emit(ExploreSuccessState(result.data));
        break;
      }
      case Fail<List<Subject>?>():{
        emit(ExploreErrorState(result.exception));
        break;
      }
    }
  }



}
sealed class ExploreScreenIntent{}

class ExploreIntent extends ExploreScreenIntent{}

sealed class ExploreScreenState{}

class ExploreInitialState extends ExploreScreenState{}
class ExploreLoadingState extends ExploreScreenState{}
class ExploreErrorState extends ExploreScreenState{
  Exception? exception;
  ExploreErrorState(this.exception);
}
class ExploreSuccessState extends ExploreScreenState{
  List<Subject>? subjects;
  ExploreSuccessState(this.subjects);
}



