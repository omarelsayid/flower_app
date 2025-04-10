
import 'package:dio/dio.dart';
import 'package:flower_app/features/home/home_tab/data/model/occasion_response_dto.dart';
import 'package:flower_app/features/auth/data/model/sign_up_response_dto.dart';
import 'package:flower_app/features/auth/domain/entity/sign_in_request.dart';
import 'package:flower_app/features/home/products_details/data/models/products_details_models.dart';
import 'package:flower_app/features/home/occasions/data/model/occasions_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/profile_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/home/best_seller_products/data/model/BestSellerProductsModel.dart';
import '../../features/home/home_tab/data/model/category_response_dto.dart';


import '../../features/home/categories/data/model/categories_response_model.dart';
import '../../features/home/categories/data/model/specific_categories_response_model.dart';
import '../../features/home/occasions/data/model/products_response_dto.dart';
import '../../features/auth/data/model/forget_response_password_dto.dart';
import '../../features/auth/data/model/reset_password_dto.dart';
import '../../features/auth/data/model/verify_email_response_dto.dart';
import '../../features/auth/domain/entity/sign_up_request.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com")
@singleton
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("/api/v1/auth/signup")
  Future<SignUpResponseDTO> signUp(@Body() SignUpRequest data);

  @POST("/api/v1/auth/signin")
  Future<HttpResponse<SignUpResponseDTO>> signIn(@Body() SignInRequest data);
  @POST("/api/v1/auth/forgotPassword")
  Future<ForgetResponsePasswordDto> forgetPassword(
    @Body() Map<String, dynamic> data,
  );


  @POST("/api/v1/auth/verifyResetCode")
  Future<VerifyEmailResponseDto> verifyEmail(@Body() Map<String, String> code);


  @PUT("/api/v1/auth/resetPassword")
  Future<ResetPasswordResponseDTO> resetPassword(@Body() Map<String, dynamic> data);

  @GET("/api/v1/best-seller")
  Future<HttpResponse<BestSellerProductsModel>> getBestSeller();

  @GET("/api/v1/categories")
  Future<CategoryResponseDTO> getCategories();

  @GET("/api/v1/occasions")
  Future<OccasionResponseDTO> getOccasion();


  @GET('/api/v1/occasions')
  Future<OccasionsResponseDTO> getOccasions();
  // @GET('/api/v1/occasions/{id}')
  // Future<SpecificOccasionsResponseDTO> getSpecificOccasion(@Path("id") String occasionId);
  @GET('/api/v1/products')
  Future<ProductsResponseDTO> getProductsByOccasion(@Query("occasion") String occasionId);


  @GET("/api/v1/products/{id}")
  Future<HttpResponse<ProductsDetailsModels>> getProductDetails(
    @Path("id") String id,
  );
  @GET("/api/v1/categories")
  Future<CategoriesResponseModel> getAllCategories();

  @GET("/api/v1/products")
  Future<SpecificCategoriesResponseModel> getSpecificCategory(
      @Query("category") String categoryId,
      );

  @GET("/api/v1/auth/profile-data")
  Future<ProfileResponseDTO> getProfileData();
  // Future<HttpResponse<ProfileResponseDTO>> getProfileData();
}


