


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/common/apiresults.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/reset_password_use_case.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordScreenState>{
  ResetPasswordUseCase resetPasswordUseCase;
  //                        start state
  ResetPasswordViewModel(this.resetPasswordUseCase):super(ResetInitialState());

  void doIntent(ResetPasswordScreenIntent intent){

    switch (intent) {

      case ResetPasswordIntent():_resetPassword(intent);

    }
  }
  void _resetPassword(ResetPasswordIntent intent) async{
    emit(ResetLoadingState());

    var result = await resetPasswordUseCase.invoke(intent.email,
        intent.password);
    switch (result) {

      case Success<User?>():{
        emit(ResetSuccessState(result.data));
        break;
      }
      case Fail<User?>():{
        emit(ResetErrorState(result.exception));
        break;
      }
    }
  }



}
sealed class ResetPasswordScreenIntent{}
class ResetPasswordIntent extends ResetPasswordScreenIntent{
  String email;
  String password;
  ResetPasswordIntent(this.email,this.password);
}


sealed class ResetPasswordScreenState{}
class ResetInitialState extends ResetPasswordScreenState{}
class ResetLoadingState extends ResetPasswordScreenState{}
class ResetErrorState extends ResetPasswordScreenState{
  Exception? exception;
  ResetErrorState(this.exception);
}
class ResetSuccessState extends ResetPasswordScreenState{
  User? user;
  ResetSuccessState(this.user){}
}



