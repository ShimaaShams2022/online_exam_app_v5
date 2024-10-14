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
import 'domain/repository/registerusecase.dart' as _i946;
import 'domain/repository/usecase.dart' as _i768;
import 'presentation/login/loginviewmodel.dart' as _i108;

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
    gh.factory<_i946.LoginUseCase>(
        () => _i946.LoginUseCase(gh<_i922.AuthRepository>()));
    gh.factory<_i768.LoginUseCase>(
        () => _i768.LoginUseCase(gh<_i922.AuthRepository>()));
    gh.factory<_i108.LoginViewModel>(
        () => _i108.LoginViewModel(gh<_i946.LoginUseCase>()));
    return this;
  }
}
