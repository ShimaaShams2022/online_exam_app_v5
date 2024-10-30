import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/auth_response_domain_model.dart';

import '../common/api_results.dart';
import 'auth_repository.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Result<AuthResponse?>> invoke(String  username,String  firstname,
  String  lastname,String  email,String  phone,String password,String  rePassword){
    return authRepository.register(username, firstname, lastname, email, phone, password, rePassword);
  }
}
