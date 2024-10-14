
import '../common/apiresults.dart';
import '../models/user.dart';

abstract class AuthRepository
{
Future<Result<User?>> login (String  email,String password);

Future<Result<User?>> register (String  username,String  firstname,
String  lastname,String  email,String  phone,String password,String  rePassword);



}