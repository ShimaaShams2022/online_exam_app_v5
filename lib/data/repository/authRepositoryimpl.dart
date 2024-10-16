import 'package:injectable/injectable.dart';

import '../../domain/common/apiresults.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/authrepository.dart';
import '../contracts/auth/authofflinedatasource.dart';
import '../contracts/auth/authonlinedatasource.dart';



@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository
{

  Authonlinedatasource onlineDataSource ;
  AuthOfflineDataSource offlineDataSource ;
  AuthRepositoryImpl(this.onlineDataSource,this.offlineDataSource);

  @override
  Future<Result<User?>>login(String email, String password) {
 return onlineDataSource.login(email, password);
  }

  @override
  Future<Result<User?>>resetPassword(String email, String password) {
    return onlineDataSource.resetPassword(email, password);
  }

  @override
  Future<Result<User?>> forgetPassword(String email) {
    return onlineDataSource.forgetPassword(email);
  }
  @override
  Future<Result<User?>> verifyPassword(String otp) {
    return onlineDataSource.verifyPassword(otp);
  }

  @override
  Future<Result<User?>>register(String username, String firstname, String lastname, String email,
      String phone, String password, String rePassword) {
return onlineDataSource.register(username, firstname, lastname, email, phone, password, rePassword)
;  }




}