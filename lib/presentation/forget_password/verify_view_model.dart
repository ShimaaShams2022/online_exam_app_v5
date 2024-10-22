
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/repository/verify_uce_case.dart';

import '../../domain/common/api_results.dart';
import '../../domain/models/user.dart';


@injectable
class VerifyViewModel extends Cubit<VerifyScreenState>{
  VerifyUseCase verifyUseCase;

  //                        start state
  VerifyViewModel(this.verifyUseCase):super(VerifyInitialState());

  void doIntent(VerifyScreenIntent intent){

    switch (intent) {

      case VerifyIntent():_VerifyPassword(intent);

    }
  }
  void _VerifyPassword(VerifyIntent intent) async{
    emit(VerifyLoadingState());

    var result = await verifyUseCase.invoke(intent.otp);
    switch (result) {

      case Success<User?>():{
        emit(VerifySuccessState(result.data));
        break;
      }
      case Fail<User?>():{
        emit(VerifyErrorState(result.exception));
        break;
      }
    }
  }



}
sealed class VerifyScreenIntent{}
class VerifyIntent extends VerifyScreenIntent{
  String otp;

  VerifyIntent(this.otp);
}


sealed class VerifyScreenState{}
class VerifyInitialState extends VerifyScreenState{}
class VerifyLoadingState extends VerifyScreenState{}
class VerifyErrorState extends VerifyScreenState{
  Exception? exception;
  VerifyErrorState(this.exception);
}
class VerifySuccessState extends VerifyScreenState{
  User? user;
  VerifySuccessState(this.user){}
}



