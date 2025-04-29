const String baseUrl = 'https://exam.elevateegy.com/api/v1/';

class ApiEndPoints {
  ApiEndPoints._();

  static const String getUserAddressesEndPoint = "/api/v1/addresses";
  static const String getProfileDataEndPoint = "/api/v1/auth/profile-data";
  static const String deleteSavedAddressEndPoint = "/api/v1/addresses/{id}";
}
