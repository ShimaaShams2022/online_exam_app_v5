
import 'package:injectable/injectable.dart';

import '../common/apiresults.dart';
import '../models/user.dart';
import 'authrepository.dart';

@injectable
class VerifyUseCase{
  AuthRepository authRepository;
  VerifyUseCase(this.authRepository);

  Future<Result<User?>> invoke(String otp){
    return authRepository.verifyPassword(otp) ;
  }
}
