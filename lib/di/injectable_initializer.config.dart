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
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../auth/data/data_source/auth_remote_data_source.dart' as _i561;
import '../auth/data/repository_imp/auth_repository_imp.dart' as _i465;
import '../auth/domain/repository/auth_repository.dart' as _i1051;
import '../auth/domain/use_case/auth_use_case.dart' as _i373;
import '../auth/domain/use_case/sign_in%20_use_case.dart' as _i679;
import '../auth/presentation/cubit/forget_password_cubit/forget_password_view_model.dart'
    as _i526;
import '../auth/presentation/cubit/reset_password_cubit/reset_password_view_model.dart'
    as _i721;
import '../auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart'
    as _i168;
import '../auth/presentation/cubit/signup_view_model.dart' as _i573;
import '../auth/presentation/cubit/verify_email_cubit/verify_email_vew_model.dart'
    as _i837;
import '../categories/data/data_source/categories_remote_data_source.dart'
    as _i324;
import '../categories/data/repository_impl/categories_repository_impl.dart'
    as _i536;
import '../categories/domain/repository/categories_repository.dart' as _i743;
import '../categories/domain/use_case/categories_use_case.dart' as _i44;
import '../categories/presentation/manager/categories_view_model.dart'
    as _i1020;
import '../core/api/api_client.dart' as _i424;
import '../core/services/internet_connection_check.dart' as _i697;
import '../home/occasions/data/data_source/occasion_remote_data_source.dart'
    as _i1016;
import '../home/occasions/data/repository_imp/occasion_repository_imp.dart'
    as _i509;
import '../home/occasions/domain/repository/occasion_repository.dart' as _i938;
import '../home/occasions/domain/use_case/occasion_use_case.dart' as _i254;
import '../home/occasions/presentation/cubit/occasion_view_model.dart' as _i736;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dataModule = _$DataModule();
    gh.singleton<_i973.InternetConnectionChecker>(
      () => dataModule.getInternetConnectionCheck(),
    );
    gh.singleton<_i424.ApiClient>(() => _i424.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i324.CategoriesRemoteDataSource>(
      () => _i324.CategoriesRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i1016.OccasionRemoteDataSource>(
      () => _i1016.OccasionRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i938.OccasionRepository>(
      () => _i509.OccasionRepositoryImpl(gh<_i1016.OccasionRemoteDataSource>()),
    );
    gh.factory<_i561.AuthRemoteDataSource>(
      () => _i561.AuthRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i743.CategoriesRepository>(
      () => _i536.CategoriesRepositoryImpl(
        gh<_i324.CategoriesRemoteDataSource>(),
      ),
    );
    gh.factory<_i1051.AuthRepository>(
      () => _i465.AuthRepositoryImpl(
        gh<_i561.AuthRemoteDataSource>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.factory<_i254.OccasionUseCase>(
      () => _i254.OccasionUseCase(gh<_i938.OccasionRepository>()),
    );
    gh.factory<_i736.OccasionViewModel>(
      () => _i736.OccasionViewModel(gh<_i254.OccasionUseCase>()),
    );
    gh.factory<_i373.AuthUseCase>(
      () => _i373.AuthUseCase(gh<_i1051.AuthRepository>()),
    );
    gh.factory<_i679.SignInUseCase>(
      () => _i679.SignInUseCase(gh<_i1051.AuthRepository>()),
    );
    gh.factory<_i44.CategoriesUseCase>(
      () => _i44.CategoriesUseCase(gh<_i743.CategoriesRepository>()),
    );
    gh.factory<_i526.ForgetPasswordViewModel>(
      () => _i526.ForgetPasswordViewModel(gh<_i373.AuthUseCase>()),
    );
    gh.factory<_i721.ResetPasswordViewModel>(
      () => _i721.ResetPasswordViewModel(gh<_i373.AuthUseCase>()),
    );
    gh.factory<_i573.SignUpViewModel>(
      () => _i573.SignUpViewModel(gh<_i373.AuthUseCase>()),
    );
    gh.factory<_i168.SignInViewModel>(
      () => _i168.SignInViewModel(gh<_i679.SignInUseCase>()),
    );
    gh.factory<_i837.VerifyEmailVewModel>(
      () => _i837.VerifyEmailVewModel(gh<_i373.AuthUseCase>()),
    );
    gh.factory<_i1020.CategoriesViewModel>(
      () => _i1020.CategoriesViewModel(gh<_i44.CategoriesUseCase>()),
    );
    return this;
  }
}

class _$DataModule extends _i697.DataModule {}
