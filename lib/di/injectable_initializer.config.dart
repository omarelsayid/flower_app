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

import '../core/api/api_client.dart' as _i424;
import '../core/network/auth_interceptor.dart' as _i552;
import '../core/network/network_module.dart' as _i419;
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
import '../features/home/best_seller_products/data/data_source/best_seller_remote_data_source.dart'
    as _i481;
import '../features/home/best_seller_products/data/data_source/best_seller_remote_data_source_impl.dart'
    as _i1016;
import '../features/home/best_seller_products/data/repository_impl/best_seller_repo_impl.dart'
    as _i601;
import '../features/home/best_seller_products/domain/repo/best_seller_repo.dart'
    as _i84;
import '../features/home/best_seller_products/domain/use_case/best_seller_use_case.dart'
    as _i215;
import '../features/home/best_seller_products/presentation/cubit/best_seller_cubit.dart'
    as _i543;
import '../features/home/categories/data/data_source/categories_remote_data_source.dart'
    as _i702;
import '../features/home/categories/data/repository_impl/categories_repository_impl.dart'
    as _i1059;
import '../features/home/categories/domain/repository/categories_repository.dart'
    as _i799;
import '../features/home/categories/domain/use_case/categories_use_case.dart'
    as _i402;
import '../features/home/categories/presentation/manager/categories_view_model.dart'
    as _i287;
import '../features/home/home_tab/data/data_source/home_data_source.dart'
    as _i235;
import '../features/home/home_tab/data/repo_imp/home_repository_impl.dart'
    as _i637;
import '../features/home/home_tab/domain/repo/home_repo.dart' as _i971;
import '../features/home/home_tab/domain/user_case/home_use_case.dart' as _i770;
import '../features/home/home_tab/presentation/cubit/best_seller_cubit/best_seller_cubit.dart'
    as _i672;
import '../features/home/home_tab/presentation/cubit/category_cubit/category_cubit.dart'
    as _i851;
import '../features/home/home_tab/presentation/cubit/occasion_cubit/occasion_cubit.dart'
    as _i137;
import '../features/home/occasions/data/data_source/occasion_remote_data_source.dart'
    as _i1007;
import '../features/home/occasions/data/repository_imp/occasion_repository_imp.dart'
    as _i141;
import '../features/home/occasions/domain/repository/occasion_repository.dart'
    as _i238;
import '../features/home/occasions/domain/use_case/occasion_use_case.dart'
    as _i518;
import '../features/home/occasions/presentation/cubit/occasion_view_model.dart'
    as _i512;
import '../features/home/products_details/data/data_source/products_details_remote_data_scource.dart'
    as _i530;
import '../features/home/products_details/data/data_source/products_details_remote_data_scource_imp.dart'
    as _i890;
import '../features/home/products_details/data/repositories/products_detail_repo_imp.dart'
    as _i647;
import '../features/home/products_details/domain/repositories/get_product_details_repo.dart'
    as _i652;
import '../features/home/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart'
    as _i83;
import '../features/profile/main_profile_screen/data/data_source/profile_remote_data_source.dart'
    as _i808;
import '../features/profile/main_profile_screen/data/repository_imp/profile_screen_repository_imp.dart'
    as _i442;
import '../features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart'
    as _i758;
import '../features/profile/main_profile_screen/domain/use_case/edit_profile_use_case.dart'
    as _i22;
import '../features/profile/main_profile_screen/domain/use_case/profile_screen_use_case.dart'
    as _i526;
import '../features/profile/main_profile_screen/domain/use_case/upload_photo_use_case.dart'
    as _i253;
import '../features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart'
    as _i339;
import '../features/profile/main_profile_screen/presentation/cubit/profile_view_model.dart'
    as _i961;
import '../features/profile/main_profile_screen/presentation/cubit/upload_photo_cubit/upload_photo_view_model.dart'
    as _i269;

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
    final dataModule = _$DataModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i973.InternetConnectionChecker>(
        () => _i697.DataModule.getInternetConnectionCheck());
    gh.lazySingleton<_i552.AuthInterceptor>(
        () => networkModule.authInterceptor);
    gh.lazySingleton<_i361.Dio>(
        () => networkModule.dio(gh<_i552.AuthInterceptor>()));
    gh.lazySingleton<_i424.ApiClient>(
        () => networkModule.apiClient(gh<_i361.Dio>()));
    gh.factory<_i481.BestSellerRemoteDataSource>(
        () => _i1016.BestSellerRemoteDataSourceImpl(gh<_i424.ApiClient>()));
    gh.factory<_i702.CategoriesRemoteDataSource>(
        () => _i702.CategoriesRemoteDataSourceImpl(gh<_i424.ApiClient>()));
    gh.factory<_i366.AuthRemoteDataSource>(
        () => _i366.AuthRemoteDataSourceImpl(gh<_i424.ApiClient>()));
    gh.factory<_i84.BestSellerRepo>(
        () => _i601.BestSellerRepoImpl(gh<_i481.BestSellerRemoteDataSource>()));
    gh.factory<_i215.BestSellerUseCase>(
        () => _i215.BestSellerUseCase(gh<_i84.BestSellerRepo>()));
    gh.factory<_i543.BestSellerViewModel>(
        () => _i543.BestSellerViewModel(gh<_i215.BestSellerUseCase>()));
    gh.factory<_i672.BestSellerCubit>(
        () => _i672.BestSellerCubit(gh<_i215.BestSellerUseCase>()));
    gh.factory<_i530.ProductsDetailsRemoteDataScource>(
        () => _i890.ProductsDetailsRemoteDataScourceImp(gh<_i424.ApiClient>()));
    gh.factory<_i235.HomeDataSource>(
        () => _i235.CategoryDataSourceImp(gh<_i424.ApiClient>()));
    gh.factory<_i799.CategoriesRepository>(() =>
        _i1059.CategoriesRepositoryImpl(
            gh<_i702.CategoriesRemoteDataSource>()));
    gh.factory<_i1007.OccasionRemoteDataSource>(
        () => _i1007.OccasionRemoteDataSourceImpl(gh<_i424.ApiClient>()));
    gh.factory<_i808.ProfileRemoteDataSource>(
        () => _i808.ProfileRemoteDataSourceImpl(gh<_i424.ApiClient>()));
    gh.factory<_i267.AuthRepository>(() => _i1042.AuthRepositoryImpl(
          gh<_i366.AuthRemoteDataSource>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i652.GetProductDetailsRepo>(() => _i647.ProductsDetailRepoImp(
        gh<_i530.ProductsDetailsRemoteDataScource>()));
    gh.factory<_i238.OccasionRepository>(() =>
        _i141.OccasionRepositoryImpl(gh<_i1007.OccasionRemoteDataSource>()));
    gh.factory<_i971.HomeRepo>(() => _i637.HomeRepositoryImpl(
          gh<_i235.HomeDataSource>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i758.ProfileRepository>(
        () => _i442.ProfileRepositoryImpl(gh<_i808.ProfileRemoteDataSource>()));
    gh.factory<_i546.AuthUseCase>(
        () => _i546.AuthUseCase(gh<_i267.AuthRepository>()));
    gh.factory<_i28.SignInUseCase>(
        () => _i28.SignInUseCase(gh<_i267.AuthRepository>()));
    gh.factory<_i83.ProductsDetailCubit>(
        () => _i83.ProductsDetailCubit(gh<_i652.GetProductDetailsRepo>()));
    gh.factory<_i402.CategoriesUseCase>(
        () => _i402.CategoriesUseCase(gh<_i799.CategoriesRepository>()));
    gh.factory<_i518.OccasionUseCase>(
        () => _i518.OccasionUseCase(gh<_i238.OccasionRepository>()));
    gh.factory<_i770.HomeUseCase>(
        () => _i770.HomeUseCase(gh<_i971.HomeRepo>()));
    gh.factory<_i229.ForgetPasswordViewModel>(
        () => _i229.ForgetPasswordViewModel(gh<_i546.AuthUseCase>()));
    gh.factory<_i205.ResetPasswordViewModel>(
        () => _i205.ResetPasswordViewModel(gh<_i546.AuthUseCase>()));
    gh.factory<_i965.SignUpViewModel>(
        () => _i965.SignUpViewModel(gh<_i546.AuthUseCase>()));
    gh.factory<_i803.SignInViewModel>(
        () => _i803.SignInViewModel(gh<_i28.SignInUseCase>()));
    gh.factory<_i851.CategoryCubit>(
        () => _i851.CategoryCubit(gh<_i770.HomeUseCase>()));
    gh.factory<_i137.OccasionCubit>(
        () => _i137.OccasionCubit(gh<_i770.HomeUseCase>()));
    gh.factory<_i287.CategoriesViewModel>(
        () => _i287.CategoriesViewModel(gh<_i402.CategoriesUseCase>()));
    gh.factory<_i882.VerifyEmailVewModel>(
        () => _i882.VerifyEmailVewModel(gh<_i546.AuthUseCase>()));
    gh.factory<_i512.OccasionViewModel>(
        () => _i512.OccasionViewModel(gh<_i518.OccasionUseCase>()));
    gh.factory<_i22.EditProfileUseCase>(
        () => _i22.EditProfileUseCase(gh<_i758.ProfileRepository>()));
    gh.factory<_i526.ProfileUseCase>(
        () => _i526.ProfileUseCase(gh<_i758.ProfileRepository>()));
    gh.factory<_i253.UploadPhotoUseCase>(
        () => _i253.UploadPhotoUseCase(gh<_i758.ProfileRepository>()));
    gh.factory<_i961.ProfileViewModel>(
        () => _i961.ProfileViewModel(gh<_i526.ProfileUseCase>()));
    gh.factory<_i339.EditProfileViewModel>(
        () => _i339.EditProfileViewModel(gh<_i22.EditProfileUseCase>()));
    gh.factory<_i269.UploadPhotoViewModel>(
        () => _i269.UploadPhotoViewModel(gh<_i253.UploadPhotoUseCase>()));
    return this;
  }
}

class _$DataModule extends _i697.DataModule {}

class _$NetworkModule extends _i419.NetworkModule {}
