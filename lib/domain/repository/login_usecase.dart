
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/auth_response_domain_model.dart';

import '../common/api_results.dart';
import '../models/user.dart';
import 'auth_repository.dart';


@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Result<AuthResponse?>> invoke(String email,String password){
    return authRepository.login(email, password) ;
  }
}
