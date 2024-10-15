import 'package:injectable/injectable.dart';

import '../common/apiresults.dart';
import '../models/user.dart';
import 'authrepository.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Result<User?>> invoke(String  username,String  firstname,
  String  lastname,String  email,String  phone,String password,String  rePassword){
    return authRepository.register(username, firstname, lastname, email, phone, password, rePassword);
  }
}
