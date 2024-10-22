import 'package:injectable/injectable.dart';

import '../common/api_results.dart';
import '../models/user.dart';
import 'auth_repository.dart';


@injectable
class ForgetPasswordUseCase{
  AuthRepository authRepository;
  ForgetPasswordUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email){
    return authRepository.forgetPassword(email) ;
  }
}
