// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api/api_manager.dart' as _i405;
import 'data/contracts/auth/auth_offline_data_source.dart' as _i258;
import 'data/contracts/auth/auth_online_data_source.dart' as _i332;
import 'data/contracts/subjects/subjects_online_data_source.dart' as _i791;
import 'data/datasource/auth/auth_offline_data_source_impl.dart' as _i605;
import 'data/datasource/auth/auth_online_data_source_impl.dart' as _i433;
import 'data/datasource/subjects/subjects_online_data_source_impl.dart'
    as _i166;
import 'data/repository/auth_repository_impl.dart' as _i448;
import 'data/repository/subjects_repository_impl.dart' as _i547;
import 'domain/repository/auth_repository.dart' as _i914;
import 'domain/repository/explore_use_case.dart' as _i1038;
import 'domain/repository/forget_password_use_case.dart' as _i533;
import 'domain/repository/login_usecase.dart' as _i871;
import 'domain/repository/register_usecase.dart' as _i702;
import 'domain/repository/reset_password_use_case.dart' as _i881;
import 'domain/repository/subjects_repository.dart' as _i92;
import 'domain/repository/verify_uce_case.dart' as _i552;
import 'presentation/forget_password/forget_password_view_model.dart' as _i1073;
import 'presentation/forget_password/reset_password_view_model.dart' as _i430;
import 'presentation/forget_password/verify_view_model.dart' as _i25;
import 'presentation/login/loginviewmodel.dart' as _i108;
import 'presentation/profile_default_Screen/explore/explore_viewmodel.dart'
    as _i140;
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
    gh.singleton<_i405.ApiManager>(() => _i405.ApiManager());
    gh.factory<_i258.AuthOfflineDataSource>(
        () => _i605.AuthOffineDataSourceImpl());
    gh.factory<_i791.SubjectsOnLineDataSource>(
        () => _i166.SubjectsOnLineDataSourceImpl(gh<_i405.ApiManager>()));
    gh.factory<_i92.SubjectsRepository>(() =>
        _i547.SubjectsRepositoryImpl(gh<_i791.SubjectsOnLineDataSource>()));
    gh.factory<_i332.Authonlinedatasource>(
        () => _i433.AuthOnlineDataSourceImpl(gh<_i405.ApiManager>()));
    gh.factory<_i1038.ExploreUseCase>(
        () => _i1038.ExploreUseCase(gh<_i92.SubjectsRepository>()));
    gh.factory<_i914.AuthRepository>(() => _i448.AuthRepositoryImpl(
          gh<_i332.Authonlinedatasource>(),
          gh<_i258.AuthOfflineDataSource>(),
        ));
    gh.factory<_i140.ExploreViewModel>(
        () => _i140.ExploreViewModel(gh<_i1038.ExploreUseCase>()));
    gh.factory<_i871.LoginUseCase>(
        () => _i871.LoginUseCase(gh<_i914.AuthRepository>()));
    gh.factory<_i702.RegisterUseCase>(
        () => _i702.RegisterUseCase(gh<_i914.AuthRepository>()));
    gh.factory<_i533.ForgetPasswordUseCase>(
        () => _i533.ForgetPasswordUseCase(gh<_i914.AuthRepository>()));
    gh.factory<_i552.VerifyUseCase>(
        () => _i552.VerifyUseCase(gh<_i914.AuthRepository>()));
    gh.factory<_i881.ResetPasswordUseCase>(
        () => _i881.ResetPasswordUseCase(gh<_i914.AuthRepository>()));
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
