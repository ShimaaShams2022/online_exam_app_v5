
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/common/api_results.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/forget_password_use_case.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordScreenState>{
  ForgetPasswordUseCase forgetPasswordCase;

  //                        start state
  ForgetPasswordViewModel(this.forgetPasswordCase):super(ForgetInitialState());

  void doIntent(ForgetPasswordScreenIntent intent){

    switch (intent) {

      case ForgetPasswordIntent():_forgetPassword(intent);

    }
  }
  void _forgetPassword(ForgetPasswordIntent intent) async{
    emit(ForgetLoadingState());

    var result = await forgetPasswordCase.invoke(intent.email);
    switch (result) {

      case Success<User?>():{
        emit(ForgetSuccessState(result.data));
        break;
      }
      case Fail<User?>():{
        emit(ForgetErrorState(result.exception));
        break;
      }
    }
  }



}
sealed class ForgetPasswordScreenIntent{}
class ForgetPasswordIntent extends ForgetPasswordScreenIntent{
  String email;

  ForgetPasswordIntent(this.email);
}


sealed class ForgetPasswordScreenState{}
class ForgetInitialState extends ForgetPasswordScreenState{}
class ForgetLoadingState extends ForgetPasswordScreenState{}
class ForgetErrorState extends ForgetPasswordScreenState{
  Exception? exception;
  ForgetErrorState(this.exception);
}
class ForgetSuccessState extends ForgetPasswordScreenState{
  User? user;
  ForgetSuccessState(this.user){

  }
}



