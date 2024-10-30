
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/common/api_results.dart';
import '../../../domain/models/auth_response_domain_model.dart';
import '../../../domain/repository/change_password_use_case.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordScreenState>{
  ChangePasswordUseCase changePasswordUseCase;
  //                        start state
  ChangePasswordViewModel(this.changePasswordUseCase):super(ChangePasswordInitialState());

  void doIntent(ChangePasswordScreenIntent intent){
    switch (intent) {

      case ChangePasswordIntent():_changePassword(intent);

    }
  }
  void _changePassword(ChangePasswordIntent intent) async{
    emit(ChangePasswordLoadingState());

    var result = await changePasswordUseCase.invoke(intent.oldPassword,intent.newPassword,intent.rePassword,intent.token);
    switch (result) {

      case Success<AuthResponse?>():{
        emit(ChangePasswordSuccessState(result.data));
      }
      case Fail<AuthResponse?>():{
        emit(ChangePasswordErrorState(result.exception));
      }
    }
  }


}
sealed class ChangePasswordScreenIntent{}
class ChangePasswordIntent extends ChangePasswordScreenIntent{

  String  oldPassword;
  String  newPassword;
  String rePassword;
  String token;

  ChangePasswordIntent({
    required this.oldPassword,
    required this.newPassword,
    required this.rePassword,
    required this.token,
 });
}


sealed class ChangePasswordScreenState{}
class ChangePasswordInitialState extends ChangePasswordScreenState{}
class ChangePasswordLoadingState extends ChangePasswordScreenState{}
class ChangePasswordErrorState extends ChangePasswordScreenState{
  Exception? exception;
  ChangePasswordErrorState(this.exception);
}
class ChangePasswordSuccessState extends ChangePasswordScreenState{
  AuthResponse? userResponse;
  ChangePasswordSuccessState(this.userResponse);
}



