import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/auth_response_domain_model.dart';

import '../common/api_results.dart';
import 'auth_repository.dart';

@injectable
class ChangePasswordUseCase{
  AuthRepository authRepository;
  ChangePasswordUseCase(this.authRepository);

  Future<Result<AuthResponse?>> invoke(String  oldPassword,String  newPassword,String rePassword,String token){
    return authRepository.changePassword(oldPassword,newPassword,rePassword,token);
  }
}
