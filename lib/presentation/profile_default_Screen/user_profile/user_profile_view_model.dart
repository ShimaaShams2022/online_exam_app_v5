import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/auth_response_domain_model.dart';

import '../../../data/api/model/request/profile_request.dart';
import '../../../domain/common/api_results.dart';
import '../../../domain/repository/user_profile_usecase.dart';


@injectable
class UserProfileViewModel extends Cubit<UserProfileScreenState>{
  UserProfileUseCase userProfile;
  //                        start state
  UserProfileViewModel(this.userProfile):super(UserProfileInitialState());

  void doIntent(UserProfileScreenIntent intent){
    switch (intent) {

      case UserProfileIntent():_userProfile(intent);

    }
  }
  void _userProfile(UserProfileIntent intent) async{
    emit(UserProfileLoadingState());

    var result = await userProfile.invoke(intent.userProfile,intent.token);
    switch (result) {

      case Success<AuthResponse?>():{
        emit(UserProfileSuccessState(result.data));
      }
      case Fail<AuthResponse?>():{
        emit(UserProfileErrorState(result.exception));
      }
    }
  }


}
sealed class UserProfileScreenIntent{}
class UserProfileIntent extends UserProfileScreenIntent{

  ProfileRequest userProfile;
  String token;

  UserProfileIntent({
    required this.userProfile,
    required this.token});
}


sealed class UserProfileScreenState{}
class UserProfileInitialState extends UserProfileScreenState{}
class UserProfileLoadingState extends UserProfileScreenState{}
class UserProfileErrorState extends UserProfileScreenState{
  Exception? exception;
  UserProfileErrorState(this.exception);
}
class UserProfileSuccessState extends UserProfileScreenState{
  AuthResponse? userResponse;
  UserProfileSuccessState(this.userResponse);
}



