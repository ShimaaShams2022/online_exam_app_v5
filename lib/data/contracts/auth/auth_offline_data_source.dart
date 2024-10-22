import '../../../domain/common/api_results.dart';
import '../../../domain/models/user.dart';

abstract class AuthOfflineDataSource {
  Future<Result<User?>>login (String  email,String password);


}