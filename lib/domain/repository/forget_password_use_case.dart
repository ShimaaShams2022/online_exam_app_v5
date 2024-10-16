import 'package:injectable/injectable.dart';

import '../common/apiresults.dart';
import '../models/user.dart';
import 'authrepository.dart';


@injectable
class ForgetPasswordUseCase{
  AuthRepository authRepository;
  ForgetPasswordUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email){
    return authRepository.forgetPassword(email) ;
  }
}
