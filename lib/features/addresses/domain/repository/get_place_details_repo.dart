import 'package:flower_app/core/common/result.dart';

abstract class GetPlaceDetailsRepo {
  Future<Result<Map<String, dynamic>>> getPlaceDetails(String placeId);
}
