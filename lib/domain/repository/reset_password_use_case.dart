
import 'package:injectable/injectable.dart';

import '../common/apiresults.dart';
import '../models/user.dart';
import 'authrepository.dart';

@injectable
class ResetPasswordUseCase{
  AuthRepository authRepository;
  ResetPasswordUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email,String password){
    return authRepository.resetPassword(email, password) ;
  }
}
