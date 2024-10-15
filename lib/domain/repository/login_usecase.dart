
import 'package:injectable/injectable.dart';

import '../common/apiresults.dart';
import '../models/user.dart';
import 'authrepository.dart';


@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email,String password){
    return authRepository.login(email, password) ;
  }
}
