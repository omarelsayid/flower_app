// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_client.dart' as _i424;
import '../features/data/data_source/auth_remote_data_source.dart' as _i340;
import '../features/data/repository_imp/auth_repository_imp.dart' as _i839;
import '../features/domain/repository/auth_repository.dart' as _i767;
import '../features/domain/use_case/auth_use_case.dart' as _i19;
import '../features/presentation/cubit/signup_view_model.dart' as _i201;
import '../features/presentation/manager/forget_password_cubit/forget_password_view_model.dart'
    as _i882;
import '../features/presentation/manager/verify_email_cubit/verify_email_vew_model.dart'
    as _i536;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i424.ApiClient>(() => _i424.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i340.AuthRemoteDataSource>(
      () => _i340.AuthRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i767.AuthRepository>(
      () => _i839.AuthRepositoryImpl(gh<_i340.AuthRemoteDataSource>()),
    );
    gh.factory<_i19.AuthUseCase>(
      () => _i19.AuthUseCase(gh<_i767.AuthRepository>()),
    );
    gh.factory<_i201.SignUpViewModel>(
      () => _i201.SignUpViewModel(gh<_i19.AuthUseCase>()),
    );
    gh.factory<_i882.ForgetPasswordViewModel>(
      () => _i882.ForgetPasswordViewModel(gh<_i19.AuthUseCase>()),
    );
    gh.factory<_i536.VerifyEmailVewModel>(
      () => _i536.VerifyEmailVewModel(gh<_i19.AuthUseCase>()),
    );
    return this;
  }
}
