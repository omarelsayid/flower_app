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
import '../features/auth/data/data_source/auth_remote_data_source.dart'
    as _i366;
import '../features/auth/data/repository_imp/auth_repository_imp.dart'
    as _i1042;
import '../features/auth/domain/repository/auth_repository.dart' as _i267;
import '../features/auth/domain/use_case/auth_use_case.dart' as _i546;
import '../features/auth/domain/use_case/sign_in%20_use_case.dart' as _i28;
import '../features/auth/presentation/cubit/forget_password_cubit/forget_password_view_model.dart'
    as _i229;
import '../features/auth/presentation/cubit/reset_password_cubit/reset_password_view_model.dart'
    as _i205;
import '../features/auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart'
    as _i803;
import '../features/auth/presentation/cubit/signup_view_model.dart' as _i965;
import '../features/auth/presentation/cubit/verify_email_cubit/verify_email_vew_model.dart'
    as _i882;
import '../features/products_details/data/data_source/products_details_remote_data_scource.dart'
    as _i1037;
import '../features/products_details/data/data_source/products_details_remote_data_scource_imp.dart'
    as _i399;
import '../features/products_details/data/repositories/products_detail_repo_imp.dart'
    as _i142;
import '../features/products_details/domain/repositories/get_product_details_repo.dart'
    as _i794;
import '../features/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart'
    as _i610;
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
    gh.factory<_i366.AuthRemoteDataSource>(
      () => _i366.AuthRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i324.CategoriesRemoteDataSource>(
      () => _i324.CategoriesRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i689.BestSellerRemoteDataSource>(
      () => _i211.BestSellerRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i1037.ProductsDetailsRemoteDataScource>(
      () => _i399.ProductsDetailsRemoteDataScourceImp(gh<_i424.ApiClient>()),
    );
    gh.factory<_i1016.OccasionRemoteDataSource>(
      () => _i1016.OccasionRemoteDataSourceImpl(gh<_i424.ApiClient>()),
    );
    gh.factory<_i938.OccasionRepository>(
      () => _i509.OccasionRepositoryImpl(gh<_i1016.OccasionRemoteDataSource>()),
    );
    gh.factory<_i267.AuthRepository>(
      () => _i1042.AuthRepositoryImpl(
        gh<_i366.AuthRemoteDataSource>(),
        gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.factory<_i743.CategoriesRepository>(
      () => _i536.CategoriesRepositoryImpl(
        gh<_i324.CategoriesRemoteDataSource>(),
      ),
    );
    gh.factory<_i118.BestSellerRepo>(
      () => _i37.BestSellerRepoImpl(gh<_i689.BestSellerRemoteDataSource>()),
    );
    gh.factory<_i254.OccasionUseCase>(
      () => _i254.OccasionUseCase(gh<_i938.OccasionRepository>()),
    );
    gh.factory<_i794.GetProductDetailsRepo>(
      () => _i142.ProductsDetailRepoImp(
        gh<_i1037.ProductsDetailsRemoteDataScource>(),
      ),
    );
    gh.factory<_i546.AuthUseCase>(
      () => _i546.AuthUseCase(gh<_i267.AuthRepository>()),
    );
    gh.factory<_i28.SignInUseCase>(
      () => _i28.SignInUseCase(gh<_i267.AuthRepository>()),
    );
    gh.factory<_i229.ForgetPasswordViewModel>(
      () => _i229.ForgetPasswordViewModel(gh<_i546.AuthUseCase>()),
    );
    gh.factory<_i205.ResetPasswordViewModel>(
      () => _i205.ResetPasswordViewModel(gh<_i546.AuthUseCase>()),
    );
    gh.factory<_i965.SignUpViewModel>(
      () => _i965.SignUpViewModel(gh<_i546.AuthUseCase>()),
    );
    gh.factory<_i736.OccasionViewModel>(
      () => _i736.OccasionViewModel(gh<_i254.OccasionUseCase>()),
    );
    gh.factory<_i803.SignInViewModel>(
      () => _i803.SignInViewModel(gh<_i28.SignInUseCase>()),
    );
    gh.factory<_i209.BestSellerUseCase>(
      () => _i209.BestSellerUseCase(gh<_i118.BestSellerRepo>()),
    );
    gh.factory<_i882.VerifyEmailVewModel>(
      () => _i882.VerifyEmailVewModel(gh<_i546.AuthUseCase>()),
    );
    gh.factory<_i44.CategoriesUseCase>(
      () => _i44.CategoriesUseCase(gh<_i743.CategoriesRepository>()),
    );
    gh.factory<_i34.BestSellerViewModel>(
      () => _i34.BestSellerViewModel(gh<_i209.BestSellerUseCase>()),
    );
    gh.factory<_i610.ProductsDetailCubit>(
      () => _i610.ProductsDetailCubit(gh<_i794.GetProductDetailsRepo>()),
    );
    gh.factory<_i1020.CategoriesViewModel>(
      () => _i1020.CategoriesViewModel(gh<_i44.CategoriesUseCase>()),
    );
    return this;
  }
}

class _$DataModule extends _i697.DataModule {}
