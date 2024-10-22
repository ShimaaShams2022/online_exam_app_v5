import '../../../domain/common/api_results.dart';
import '../../../domain/models/user.dart';

abstract class Authonlinedatasource {

  Future<Result<User?>>login (String  email,String password);

  Future<Result<User?>> resetPassword (String  email,String password);

  Future<Result<User?>> forgetPassword (String  email);

  Future<Result<User?>> verifyPassword (String  otp);

  Future<Result<User?>> register (String  username,String  firstname,
      String  lastname,String  email,String  phone,String password,String  rePassword);




}