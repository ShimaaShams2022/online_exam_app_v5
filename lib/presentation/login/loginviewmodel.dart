
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../domain/common/api_results.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/login_usecase.dart';


@injectable
class LoginViewModel extends Cubit<LoginScreenState>{
  LoginUseCase loginCase;
  //                        start state
  LoginViewModel(this.loginCase):super(LoginInitialState());

  void doIntent(LoginScreenIntent intent){

    switch (intent) {

      case LoginIntent():_login(intent);

    }
  }
  void _login(LoginIntent intent) async{
    emit(LoginLoadingState());

    var result = await loginCase.invoke(intent.email,
        intent.password);
    switch (result) {

      case Success<User?>():{
        emit(LoginSuccessState(result.data));
        break;
      }
      case Fail<User?>():{
        emit(LoginErrorState(result.exception));
        break;
      }
    }
  }



}
sealed class LoginScreenIntent{}
class LoginIntent extends LoginScreenIntent{
  String email;
  String password;
  LoginIntent(this.email,this.password);
}


sealed class LoginScreenState{}
class LoginInitialState extends LoginScreenState{}
class LoginLoadingState extends LoginScreenState{}
class LoginErrorState extends LoginScreenState{
  Exception? exception;
  LoginErrorState(this.exception);
}
class LoginSuccessState extends LoginScreenState{
  User? user;
 LoginSuccessState(this.user){

  }
}



