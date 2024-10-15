import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/common/apiresults.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterScreenState>{
  RegisterUseCase registerCase;
  //                        start state
  RegisterViewModel(this.registerCase):super(InitialState());

  void doIntent(RegisterScreenIntent intent){
    switch (intent) {

      case RegisterIntent():_register(intent);

    }
  }
  void _register(RegisterIntent intent) async{
    emit(LoadingState());

    var result = await registerCase.invoke(intent.username,intent.firstname,intent.lastname,
       intent.email, intent.password,intent.rePassword,intent.phone);
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
sealed class RegisterScreenIntent{}
class RegisterIntent extends RegisterScreenIntent{
  String  username;
  String  firstname;
  String  lastname;
  String  email;
  String password;
  String  rePassword;
  String  phone;

  RegisterIntent({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone});
}


sealed class RegisterScreenState{}
class InitialState extends RegisterScreenState{}
class LoadingState extends RegisterScreenState{}
class ErrorState extends RegisterScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends RegisterScreenState{
  User? user;
  SuccessState(this.user);
}



