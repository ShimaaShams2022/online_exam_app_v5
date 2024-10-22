
import 'package:injectable/injectable.dart';

import '../common/api_results.dart';
import '../models/user.dart';
import 'auth_repository.dart';

@injectable
class ResetPasswordUseCase{
  AuthRepository authRepository;
  ResetPasswordUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email,String password){
    return authRepository.resetPassword(email, password) ;
  }
}
