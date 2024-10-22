
import 'package:injectable/injectable.dart';

import '../../../domain/common/api_results.dart';
import '../../../domain/models/user.dart';
import '../../api/api_manager.dart';
import '../../api/model/api_extensions.dart';
import '../../api/model/request/register_request.dart';

import '../../contracts/auth/auth_online_data_source.dart';

@Injectable(as:Authonlinedatasource )
class AuthOnlineDataSourceImpl implements Authonlinedatasource{
  ApiManager apiManager;

  AuthOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<User?>> login(String email, String password) async {

    return executeApi<User?>(() async {
      var authResponse = await apiManager.login(email, password);
      var userDto = authResponse?.userDto;
      return userDto?.toUser();
    }
    );
    }


  @override
  Future<Result<User?>> resetPassword(String email, String password) async {

    return executeApi<User?>(() async {
      var authResponse = await apiManager.resetPassword(email, password);
      var userDto = authResponse?.userDto;
      return userDto?.toUser();
    });


  }



  @override
  Future<Result<User?>> forgetPassword(String email) async {

    return executeApi<User?>(() async {
      var authResponse = await apiManager.forgetPassword(email);
      var userDto =authResponse?.userDto;
      return userDto?.toUser();
    });


  }

  @override
  Future<Result<User?>> verifyPassword(String otp) async {

    return executeApi<User?>(() async {
      var authResponse = await apiManager.verifyPassword(otp);
      var userDto = authResponse?.userDto;
      return userDto?.toUser();
    });


  }


  @override
  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var body = RegisterRequest(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword,
    );

    return executeApi<User?>(() async {
      var response = await apiManager.register(body);
      print(response?.userDto?.email);
      var userDto = response?.userDto;
      print(userDto?.toUser().email);
      return userDto?.toUser();
    });

  }
}
