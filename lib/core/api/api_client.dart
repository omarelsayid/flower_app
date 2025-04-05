
import 'package:dio/dio.dart';
import 'package:flower_app/auth/data/model/sign_up_response_dto.dart';
import 'package:flower_app/auth/domain/entity/sign_in_request.dart';
import 'package:flower_app/home_tab/data/model/occasion_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../auth/data/model/forget_response_password_dto.dart';
import '../../auth/data/model/reset_password_dto.dart';
import '../../auth/data/model/verify_email_response_dto.dart';
import '../../auth/domain/entity/sign_up_request.dart';
import '../../best_seller_products/data/model/BestSellerProductsModel.dart';
import '../../home_tab/data/model/category_response_dto.dart';


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
  Future<ForgetResponsePasswordDto> forgetPassword(@Body() Map<String,dynamic> data);

  @POST("/api/v1/auth/verifyResetCode")
  Future<VerifyEmailResponseDto> verifyEmail(@Body() Map<String,String> code);


  @PUT("/api/v1/auth/resetPassword")
  Future<ResetPasswordResponseDTO> resetPassword(@Body() Map<String, dynamic> data);
  
  @GET("/api/v1/best-seller")
  Future<HttpResponse<BestSellerProductsModel>> getBestSeller();

  @GET("/api/v1/categories")
  Future<CategoryResponseDTO> getCategories();

  @GET("/api/v1/occasions")
  Future<OccasionResponseDTO> getOccasion();

}


