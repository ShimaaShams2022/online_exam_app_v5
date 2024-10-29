
import '../../data/api/model/request/profile_request.dart';
import '../common/api_results.dart';
import '../models/auth_response_domain_model.dart';
import '../models/user.dart';

abstract class AuthRepository
{
Future<Result<AuthResponse?>> login (String  email,String password);

Future<Result<User?>> forgetPassword (String  email);
Future<Result<User?>> verifyPassword (String  otp);
Future<Result<User?>> resetPassword (String  email,String password);

Future<Result<AuthResponse?>> register (String  username,String  firstname,
String  lastname,String  email,String  phone,String password,String  rePassword);

Future<Result<AuthResponse?>> userProfile (ProfileRequest userProfile,String token);

}