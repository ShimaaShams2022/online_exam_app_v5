import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/common/apiresults.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterScreenState>{
  RegisterUseCase registerCase;
  //                        start state
  RegisterViewModel(this.registerCase):super(RegisterInitialState());

  void doIntent(RegisterScreenIntent intent){
    switch (intent) {

      case RegisterIntent():_register(intent);

    }
  }
  void _register(RegisterIntent intent) async{
    emit(RegisterLoadingState());

    var result = await registerCase.invoke(intent.username,intent.firstname,intent.lastname,
       intent.email, intent.password,intent.rePassword,intent.phone);
    switch (result) {

      case Success<User?>():{
        emit(RegisterSuccessState(result.data));
      }
      case Fail<User?>():{
        emit(RegisterErrorState(result.exception));
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
class RegisterInitialState extends RegisterScreenState{}
class RegisterLoadingState extends RegisterScreenState{}
class RegisterErrorState extends RegisterScreenState{
  Exception? exception;
  RegisterErrorState(this.exception);
}
class RegisterSuccessState extends RegisterScreenState{
  User? user;
  RegisterSuccessState(this.user);
}



