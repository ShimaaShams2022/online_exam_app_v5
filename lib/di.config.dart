// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api/apimanager.dart' as _i97;
import 'data/contracts/auth/authofflinedatasource.dart' as _i1062;
import 'data/contracts/auth/authonlinedatasource.dart' as _i424;
import 'data/datasource/auth/authofflinedatasourceimpl.dart' as _i649;
import 'data/datasource/auth/authonlinedatasourceimpl.dart' as _i570;
import 'data/repository/authRepositoryimpl.dart' as _i134;
import 'domain/repository/authrepository.dart' as _i922;
import 'domain/repository/forget_password_use_case.dart' as _i533;
import 'domain/repository/login_usecase.dart' as _i871;
import 'domain/repository/register_usecase.dart' as _i702;
import 'domain/repository/reset_password_use_case.dart' as _i881;
import 'domain/repository/verify_uce_case.dart' as _i552;
import 'presentation/forget_password/forget_password_view_model.dart' as _i1073;
import 'presentation/forget_password/reset_password_view_model.dart' as _i430;
import 'presentation/forget_password/verify_view_model.dart' as _i25;
import 'presentation/login/loginviewmodel.dart' as _i108;
import 'presentation/register/register_view_model.dart' as _i733;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i97.ApiManager>(() => _i97.ApiManager());
    gh.factory<_i1062.AuthOfflineDataSource>(
        () => _i649.AuthOffineDataSourceImpl());
    gh.factory<_i424.Authonlinedatasource>(
        () => _i570.AuthOnlineDataSourceImpl(gh<_i97.ApiManager>()));
    gh.factory<_i922.AuthRepository>(() => _i134.AuthRepositoryImpl(
          gh<_i424.Authonlinedatasource>(),
          gh<_i1062.AuthOfflineDataSource>(),
        ));
    gh.factory<_i871.LoginUseCase>(
        () => _i871.LoginUseCase(gh<_i922.AuthRepository>()));
    gh.factory<_i702.RegisterUseCase>(
        () => _i702.RegisterUseCase(gh<_i922.AuthRepository>()));
    gh.factory<_i533.ForgetPasswordUseCase>(
        () => _i533.ForgetPasswordUseCase(gh<_i922.AuthRepository>()));
    gh.factory<_i552.VerifyUseCase>(
        () => _i552.VerifyUseCase(gh<_i922.AuthRepository>()));
    gh.factory<_i881.ResetPasswordUseCase>(
        () => _i881.ResetPasswordUseCase(gh<_i922.AuthRepository>()));
    gh.factory<_i1073.ForgetPasswordViewModel>(() =>
        _i1073.ForgetPasswordViewModel(gh<_i533.ForgetPasswordUseCase>()));
    gh.factory<_i430.ResetPasswordViewModel>(
        () => _i430.ResetPasswordViewModel(gh<_i881.ResetPasswordUseCase>()));
    gh.factory<_i733.RegisterViewModel>(
        () => _i733.RegisterViewModel(gh<_i702.RegisterUseCase>()));
    gh.factory<_i25.VerifyViewModel>(
        () => _i25.VerifyViewModel(gh<_i552.VerifyUseCase>()));
    gh.factory<_i108.LoginViewModel>(
        () => _i108.LoginViewModel(gh<_i871.LoginUseCase>()));
    return this;
  }
}
