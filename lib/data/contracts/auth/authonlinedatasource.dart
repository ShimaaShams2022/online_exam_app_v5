import '../../../domain/common/apiresults.dart';
import '../../../domain/models/user.dart';

abstract class Authonlinedatasource {

  Future<Result<User?>>login (String  email,String password);


  Future<Result<User?>> register (String  username,String  firstname,
      String  lastname,String  email,String  phone,String password,String  rePassword);




}