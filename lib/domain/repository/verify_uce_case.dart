
import 'package:injectable/injectable.dart';

import '../common/api_results.dart';
import '../models/user.dart';
import 'auth_repository.dart';

@injectable
class VerifyUseCase{
  AuthRepository authRepository;
  VerifyUseCase(this.authRepository);

  Future<Result<User?>> invoke(String otp){
    return authRepository.verifyPassword(otp) ;
  }
}
