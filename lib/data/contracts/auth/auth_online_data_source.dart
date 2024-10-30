import 'package:online_exam_app_v5/data/api/model/request/profile_request.dart';
import 'package:online_exam_app_v5/domain/models/auth_response_domain_model.dart';

import '../../../domain/common/api_results.dart';
import '../../../domain/models/user.dart';

abstract class Authonlinedatasource {

  Future<Result<AuthResponse?>>login (String  email,String password);

  Future<Result<User?>> resetPassword (String  email,String password);

  Future<Result<User?>> forgetPassword (String  email);

  Future<Result<User?>> verifyPassword (String  otp);

  Future<Result<AuthResponse?>> register (String  username,String  firstname,
      String  lastname,String  email,String  phone,String password,String  rePassword);

  Future<Result<AuthResponse?>> userProfile (ProfileRequest userProfile,String token);

  Future<Result<AuthResponse?>> changePassword (String oldPassword,String newPassword,String rePassword,String token);

}