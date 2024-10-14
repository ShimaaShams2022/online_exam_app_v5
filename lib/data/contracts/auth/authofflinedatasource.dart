import '../../../domain/common/apiresults.dart';
import '../../../domain/models/user.dart';

abstract class AuthOfflineDataSource {
  Future<Result<User?>>login (String  email,String password);


}