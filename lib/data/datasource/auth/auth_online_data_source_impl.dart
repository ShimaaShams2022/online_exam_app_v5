
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/domain/models/auth_response_domain_model.dart';

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
  Future<Result<AuthResponse?>> login(String email, String password) async {

    return executeApi<AuthResponse?>(() async {
      var authResponseDto = await apiManager.login(email, password);

      return authResponseDto?.toAuthResponse();
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
  Future<Result<AuthResponse?>> register(
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

    return executeApi<AuthResponse?>(() async {
      var response = await apiManager.register(body);

      return response?.toAuthResponse();
    });

  }
}
