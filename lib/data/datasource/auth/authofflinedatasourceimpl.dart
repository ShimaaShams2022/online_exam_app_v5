
import 'package:injectable/injectable.dart';

import '../../../domain/common/apiresults.dart';
import '../../../domain/models/user.dart';
import '../../contracts/auth/authofflinedatasource.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOffineDataSourceImpl implements AuthOfflineDataSource {

  @override
  Future<Result<User?>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}