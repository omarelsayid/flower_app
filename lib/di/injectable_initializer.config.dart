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
import '../best_seller_products/data/data_source/best_seller_remote_data_source.dart'
    as _i689;
import '../best_seller_products/data/data_source/best_seller_remote_data_source_impl.dart'
    as _i211;
import '../best_seller_products/data/repository_impl/best_seller_repo_impl.dart'
    as _i37;
import '../best_seller_products/domain/repo/best_seller_repo.dart' as _i118;
import '../best_seller_products/domain/use_case/best_seller_use_case.dart'
    as _i209;
import '../best_seller_products/presentation/cubit/best_seller_cubit.dart'
    as _i34;
import '../core/api/api_client.dart' as _i424;
import '../core/services/internet_connection_check.dart' as _i697;

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
    gh.factory<_i689.BestSellerRemoteDataSource>(
      () => _i211.BestSellerRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i561.AuthRemoteDataSource>(
      () => _i561.AuthRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i118.BestSellerRepo>(
      () => _i37.BestSellerRepoImpl(gh<_i689.BestSellerRemoteDataSource>()),
    );
    gh.factory<_i1051.AuthRepository>(
      () => _i465.AuthRepositoryImpl(
        gh<_i561.AuthRemoteDataSource>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.factory<_i373.AuthUseCase>(
      () => _i373.AuthUseCase(gh<_i1051.AuthRepository>()),
    );
    gh.factory<_i679.SignInUseCase>(
      () => _i679.SignInUseCase(gh<_i1051.AuthRepository>()),
    );
    gh.factory<_i209.BestSellerUseCase>(
      () => _i209.BestSellerUseCase(gh<_i118.BestSellerRepo>()),
    );
    gh.factory<_i34.BestSellerViewModel>(
      () => _i34.BestSellerViewModel(gh<_i209.BestSellerUseCase>()),
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
    return this;
  }
}

class _$DataModule extends _i697.DataModule {}
