
import 'package:dio/dio.dart';
import 'package:flower_app/core/utils/end_points.dart';
import 'package:flower_app/features/addresses/data/model/user_addresses_dto.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/features/cart/data/models/create_cart_reponse.dart';
import 'package:flower_app/features/cart/data/models/delet_cart_item_dto/delete_cart_response_dto.dart';
import 'package:flower_app/features/cart/data/models/update_product_quantity/update_cart_quantity_response_dto.dart';
import 'package:flower_app/features/cart/data/models/user_cart_response/user_cart_response_model.dart';
import 'package:flower_app/features/home/home_tab/data/model/occasion_response_dto.dart';
import 'package:flower_app/features/auth/data/model/sign_up_response_dto.dart';
import 'package:flower_app/features/auth/domain/entity/sign_in_request.dart';
import 'package:flower_app/features/home/products_details/data/models/products_details_models.dart';
import 'package:flower_app/features/home/occasions/data/model/occasions_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/change_password_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_response_dto.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/profile_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/cart/data/models/create_cart_request.dart';
import '../../features/cart/data/models/update_product_quantity/update_cart_quantity_request.dart';
import '../../features/home/best_seller_products/data/model/BestSellerProductsModel.dart';
import '../../features/home/home_tab/data/model/category_response_dto.dart';


import '../../features/home/categories/data/model/categories_response_model.dart';
import '../../features/home/categories/data/model/specific_categories_response_model.dart';
import '../../features/home/occasions/data/model/products_response_dto.dart';
import '../../features/auth/data/model/forget_response_password_dto.dart';
import '../../features/auth/data/model/reset_password_dto.dart';
import '../../features/auth/data/model/verify_email_response_dto.dart';
import '../../features/auth/domain/entity/sign_up_request.dart';
import '../../features/profile/main_profile_screen/data/model/change_password_request_model.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://flower.elevateegy.com")
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/api/v1/auth/profile-data")
  Future<ProfileResponseDTO> getProfileData(
    @Header("Authorization") String token,
  );


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
  Future<ResetPasswordResponseDTO> resetPassword(
    @Body() Map<String, dynamic> data,
  );

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
  Future<ProductsResponseDTO> getProductsByOccasion(
    @Query("occasion") String occasionId,
  );

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

  @GET("/api/v1/auth/logout")
  Future<HttpResponse<void>> logout(@Header("Authorization") String token);
  Future<HttpResponse<void>> logout();


  @GET(ApiEndPoints.getProfileDataEndPoint)
  Future<ProfileResponseDTO> getProfileData();

  @PATCH("/api/v1/auth/change-password")
  Future<ChangePasswordModel> changePassword(
    @Body() ChangePasswordRequestModel data,
    @Header("Authorization") String token,
  );
  @PUT("/api/v1/auth/editProfile")
  Future<HttpResponse<EditProfileResponseDTO>> editProfile(
    @Header("Authorization") String token,
    // @Body() EditProfileRequest data,
    @Body() Map<String, dynamic> data,
  );

  @PUT("/api/v1/auth/upload-photo")
  @MultiPart()
  Future<String?> uploadPhoto(
    @Header("Authorization") String token,
    @Body() FormData formData,
  );
  //========================================================================
  //==========================Cart Api======================================

  @POST("/api/v1/cart")
  Future<HttpResponse<CreateCartResponse>> addProductToCart(
    @Header("Authorization") String token,
    @Body() CreateCartRequest request,
  );

  @GET("/api/v1/cart")
  Future<UserCartResponseModel> getUserCart(
    @Header("Authorization") String token,
  );

  @DELETE("/api/v1/cart/{id}")
  Future<HttpResponse<DeleteCartResponseDTO>> deleteCartItem(
    @Header("Authorization") String token,
    @Path("id") String id,
  );

  @PUT("/api/v1/cart/{id}")
  Future<HttpResponse<UpdateCartQuantityResponseDTO>> updateCartQuantity(
      @Header("Authorization") String token,
      @Path("id") String id,
      @Body() UpdateCartQuantityRequest request,
      );
  ////////////////////////User addresses//////////////////
  @GET(ApiEndPoints.getUserAddressesEndPoint)
  Future<UserAddressesDTO> getUserAddresses();

  @DELETE(ApiEndPoints.deleteSavedAddressEndPoint)
  Future<HttpResponse<UserAddressesDTO>> deleteUserAddress(
      @Path("id") String id,
      );

}
    @Header("Authorization") String token,
    @Path("id") String id,
    @Body() UpdateCartQuantityRequest request,
  );

  @PATCH('/api/v1/addresses')
  Future<void> saveUserAddress(
    @Header("Authorization") String token,
    @Body() AddressDetailsModel addressDetailsModel,
  );
}
