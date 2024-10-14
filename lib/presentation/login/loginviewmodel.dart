import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/common/apiresults.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/registerusecase.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState>{
  LoginUseCase loginCase;
  //                        start state
  LoginViewModel(this.loginCase):super(InitialState());

  void doIntent(LoginScreenIntent intent){
    switch (intent) {

      case LoginIntent():_login(intent);

    }
  }
  void _login(LoginIntent intent) async{
    emit(LoadingState());

    var result = await loginCase.invoke(intent.email,
        intent.password);
    switch (result) {

      case Success<User?>():{
        emit(SuccessState(result.data));
      }
      case Fail<User?>():{
        emit(ErrorState(result.exception));
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
class InitialState extends LoginScreenState{}
class LoadingState extends LoginScreenState{}
class ErrorState extends LoginScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends LoginScreenState{
  User? user;
  SuccessState(this.user);
}



