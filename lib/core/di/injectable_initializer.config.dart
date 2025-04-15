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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/data_source/auth_remote_data_source.dart'
    as _i182;
import '../../features/auth/data/repository_imp/auth_repository_imp.dart'
    as _i62;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_case/auth_use_case.dart' as _i701;
import '../../features/auth/domain/use_case/sign_in%20_use_case.dart' as _i489;
import '../../features/auth/presentation/cubit/forget_password_cubit/forget_password_view_model.dart'
    as _i614;
import '../../features/auth/presentation/cubit/reset_password_cubit/reset_password_view_model.dart'
    as _i931;
import '../../features/auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart'
    as _i347;
import '../../features/auth/presentation/cubit/signup_view_model.dart' as _i306;
import '../../features/auth/presentation/cubit/verify_email_cubit/verify_email_vew_model.dart'
    as _i357;
import '../../features/home/best_seller_products/data/data_source/best_seller_remote_data_source.dart'
    as _i550;
import '../../features/home/best_seller_products/data/data_source/best_seller_remote_data_source_impl.dart'
    as _i1001;
import '../../features/home/best_seller_products/data/repository_impl/best_seller_repo_impl.dart'
    as _i174;
import '../../features/home/best_seller_products/domain/repo/best_seller_repo.dart'
    as _i330;
import '../../features/home/best_seller_products/domain/use_case/best_seller_use_case.dart'
    as _i480;
import '../../features/home/best_seller_products/presentation/cubit/best_seller_cubit.dart'
    as _i237;
import '../../features/home/categories/data/data_source/categories_remote_data_source.dart'
    as _i1070;
import '../../features/home/categories/data/repository_impl/categories_repository_impl.dart'
    as _i913;
import '../../features/home/categories/domain/repository/categories_repository.dart'
    as _i129;
import '../../features/home/categories/domain/use_case/categories_use_case.dart'
    as _i723;
import '../../features/home/categories/presentation/manager/categories_view_model.dart'
    as _i720;
import '../../features/home/home_tab/data/data_source/home_data_source.dart'
    as _i246;
import '../../features/home/home_tab/data/repo_imp/home_repository_impl.dart'
    as _i20;
import '../../features/home/home_tab/domain/repo/home_repo.dart' as _i352;
import '../../features/home/home_tab/domain/user_case/home_use_case.dart'
    as _i423;
import '../../features/home/home_tab/presentation/cubit/best_seller_cubit/best_seller_cubit.dart'
    as _i85;
import '../../features/home/home_tab/presentation/cubit/category_cubit/category_cubit.dart'
    as _i737;
import '../../features/home/home_tab/presentation/cubit/occasion_cubit/occasion_cubit.dart'
    as _i9;
import '../../features/home/occasions/data/data_source/occasion_remote_data_source.dart'
    as _i425;
import '../../features/home/occasions/data/repository_imp/occasion_repository_imp.dart'
    as _i710;
import '../../features/home/occasions/domain/repository/occasion_repository.dart'
    as _i920;
import '../../features/home/occasions/domain/use_case/occasion_use_case.dart'
    as _i66;
import '../../features/home/occasions/presentation/cubit/occasion_view_model.dart'
    as _i602;
import '../../features/home/products_details/data/data_source/products_details_remote_data_scource.dart'
    as _i332;
import '../../features/home/products_details/data/data_source/products_details_remote_data_scource_imp.dart'
    as _i382;
import '../../features/home/products_details/data/repositories/products_detail_repo_imp.dart'
    as _i29;
import '../../features/home/products_details/domain/repositories/get_product_details_repo.dart'
    as _i798;
import '../../features/home/products_details/presentation/cubits/product_details_cubit/products_detail_cubit.dart'
    as _i8;
import '../../features/profile/main_profile_screen/data/data_source/change_pasword_data_source.dart'
    as _i584;
import '../../features/profile/main_profile_screen/data/data_source/profile_local_data_source.dart'
    as _i678;
import '../../features/profile/main_profile_screen/data/data_source/profile_remote_data_source.dart'
    as _i428;
import '../../features/profile/main_profile_screen/data/repository_imp/change_password_repositoy_impl.dart'
    as _i782;
import '../../features/profile/main_profile_screen/data/repository_imp/profile_screen_repository_imp.dart'
    as _i62;
import '../../features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart'
    as _i152;
import '../../features/profile/main_profile_screen/domain/repository/reset_password_repository.dart'
    as _i890;
import '../../features/profile/main_profile_screen/domain/use_case/change_password_use_case.dart'
    as _i922;
import '../../features/profile/main_profile_screen/domain/use_case/edit_profile_use_case.dart'
    as _i295;
import '../../features/profile/main_profile_screen/domain/use_case/profile_screen_use_case.dart'
    as _i929;
import '../../features/profile/main_profile_screen/domain/use_case/upload_photo_use_case.dart'
    as _i801;
import '../../features/profile/main_profile_screen/presentation/cubit/change_password_cubit/change_password_view-model.dart'
    as _i378;
import '../../features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart'
    as _i177;
import '../../features/profile/main_profile_screen/presentation/cubit/profile_view_model.dart'
    as _i513;
import '../../features/profile/main_profile_screen/presentation/cubit/upload_photo_cubit/upload_photo_view_model.dart'
    as _i480;
import '../api/api_client.dart' as _i277;
import '../api/network_factory.dart' as _i1013;
import '../network/auth_interceptor.dart' as _i908;

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
    final dioProvider = _$DioProvider();
    gh.factory<_i908.AuthInterceptor>(() => dioProvider.authInterceptor);
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i550.BestSellerRemoteDataSource>(
        () => _i1001.BestSellerRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i584.ChangePasswordDataSource>(
        () => _i584.ChangePasswordDataSourceImp(gh<_i277.ApiClient>()));
    gh.factory<_i1070.CategoriesRemoteDataSource>(
        () => _i1070.CategoriesRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i182.AuthRemoteDataSource>(
        () => _i182.AuthRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i961.AuthRepository>(
        () => _i62.AuthRepositoryImpl(gh<_i182.AuthRemoteDataSource>()));
    gh.factory<_i890.ChangePasswordRepository>(() =>
        _i782.ChangePasswordRepositoryImp(
            gh<_i584.ChangePasswordDataSource>()));
    gh.factory<_i330.BestSellerRepo>(
        () => _i174.BestSellerRepoImpl(gh<_i550.BestSellerRemoteDataSource>()));
    gh.factory<_i701.AuthUseCase>(
        () => _i701.AuthUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i489.SignInUseCase>(
        () => _i489.SignInUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i678.ProfileLocalDataSource>(
        () => _i678.ProfileLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i480.BestSellerUseCase>(
        () => _i480.BestSellerUseCase(gh<_i330.BestSellerRepo>()));
    gh.factory<_i237.BestSellerViewModel>(
        () => _i237.BestSellerViewModel(gh<_i480.BestSellerUseCase>()));
    gh.factory<_i85.BestSellerCubit>(
        () => _i85.BestSellerCubit(gh<_i480.BestSellerUseCase>()));
    gh.factory<_i332.ProductsDetailsRemoteDataScource>(
        () => _i382.ProductsDetailsRemoteDataScourceImp(gh<_i277.ApiClient>()));
    gh.factory<_i614.ForgetPasswordViewModel>(
        () => _i614.ForgetPasswordViewModel(gh<_i701.AuthUseCase>()));
    gh.factory<_i931.ResetPasswordViewModel>(
        () => _i931.ResetPasswordViewModel(gh<_i701.AuthUseCase>()));
    gh.factory<_i306.SignUpViewModel>(
        () => _i306.SignUpViewModel(gh<_i701.AuthUseCase>()));
    gh.factory<_i347.SignInViewModel>(
        () => _i347.SignInViewModel(gh<_i489.SignInUseCase>()));
    gh.factory<_i246.HomeDataSource>(
        () => _i246.CategoryDataSourceImp(gh<_i277.ApiClient>()));
    gh.factory<_i129.CategoriesRepository>(() => _i913.CategoriesRepositoryImpl(
        gh<_i1070.CategoriesRemoteDataSource>()));
    gh.factory<_i425.OccasionRemoteDataSource>(
        () => _i425.OccasionRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i428.ProfileRemoteDataSource>(
        () => _i428.ProfileRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i152.ProfileRepository>(() => _i62.ProfileRepositoryImpl(
          gh<_i428.ProfileRemoteDataSource>(),
          gh<_i678.ProfileLocalDataSource>(),
        ));
    gh.factory<_i357.VerifyEmailVewModel>(
        () => _i357.VerifyEmailVewModel(gh<_i701.AuthUseCase>()));
    gh.factory<_i922.ChangePasswordUseCase>(() =>
        _i922.ChangePasswordUseCase(gh<_i890.ChangePasswordRepository>()));
    gh.factory<_i798.GetProductDetailsRepo>(() => _i29.ProductsDetailRepoImp(
        gh<_i332.ProductsDetailsRemoteDataScource>()));
    gh.factory<_i920.OccasionRepository>(() =>
        _i710.OccasionRepositoryImpl(gh<_i425.OccasionRemoteDataSource>()));
    gh.factory<_i929.ProfileUseCase>(
        () => _i929.ProfileUseCase(gh<_i152.ProfileRepository>()));
    gh.factory<_i295.EditProfileUseCase>(
        () => _i295.EditProfileUseCase(gh<_i152.ProfileRepository>()));
    gh.factory<_i801.UploadPhotoUseCase>(
        () => _i801.UploadPhotoUseCase(gh<_i152.ProfileRepository>()));
    gh.factory<_i352.HomeRepo>(
        () => _i20.HomeRepositoryImpl(gh<_i246.HomeDataSource>()));
    gh.factory<_i378.ChangePasswordViewModel>(
        () => _i378.ChangePasswordViewModel(gh<_i922.ChangePasswordUseCase>()));
    gh.factory<_i8.ProductsDetailCubit>(
        () => _i8.ProductsDetailCubit(gh<_i798.GetProductDetailsRepo>()));
    gh.factory<_i723.CategoriesUseCase>(
        () => _i723.CategoriesUseCase(gh<_i129.CategoriesRepository>()));
    gh.factory<_i66.OccasionUseCase>(
        () => _i66.OccasionUseCase(gh<_i920.OccasionRepository>()));
    gh.factory<_i423.HomeUseCase>(
        () => _i423.HomeUseCase(gh<_i352.HomeRepo>()));
    gh.factory<_i513.ProfileViewModel>(() => _i513.ProfileViewModel(
          gh<_i929.ProfileUseCase>(),
          gh<_i678.ProfileLocalDataSource>(),
        ));
    gh.factory<_i737.CategoryCubit>(
        () => _i737.CategoryCubit(gh<_i423.HomeUseCase>()));
    gh.factory<_i9.OccasionCubit>(
        () => _i9.OccasionCubit(gh<_i423.HomeUseCase>()));
    gh.factory<_i177.EditProfileViewModel>(
        () => _i177.EditProfileViewModel(gh<_i295.EditProfileUseCase>()));
    gh.factory<_i720.CategoriesViewModel>(
        () => _i720.CategoriesViewModel(gh<_i723.CategoriesUseCase>()));
    gh.factory<_i602.OccasionViewModel>(
        () => _i602.OccasionViewModel(gh<_i66.OccasionUseCase>()));
    gh.factory<_i480.UploadPhotoViewModel>(
        () => _i480.UploadPhotoViewModel(gh<_i801.UploadPhotoUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
