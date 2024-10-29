import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/auth_response_domain_model.dart';

import '../../data/api/model/request/profile_request.dart';
import '../common/api_results.dart';
import '../models/user.dart';
import 'auth_repository.dart';

@injectable
class UserProfileUseCase{
  AuthRepository authRepository;
  UserProfileUseCase(this.authRepository);

  Future<Result<AuthResponse?>> invoke(ProfileRequest userProfile,String token){
    return authRepository.userProfile(userProfile,token);
  }
}
