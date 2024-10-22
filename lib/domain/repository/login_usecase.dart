
import 'package:injectable/injectable.dart';

import '../common/api_results.dart';
import '../models/user.dart';
import 'auth_repository.dart';


@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email,String password){
    return authRepository.login(email, password) ;
  }
}
