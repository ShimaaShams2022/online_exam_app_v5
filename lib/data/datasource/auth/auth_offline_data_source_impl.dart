
import 'package:injectable/injectable.dart';

import '../../../domain/common/api_results.dart';
import '../../../domain/models/user.dart';
import '../../contracts/auth/auth_offline_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOffineDataSourceImpl implements AuthOfflineDataSource {

  @override
  Future<Result<User?>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}