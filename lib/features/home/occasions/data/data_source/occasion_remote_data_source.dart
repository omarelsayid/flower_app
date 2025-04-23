import 'package:flower_app/features/home/occasions/data/model/occasions_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_client.dart';
import '../model/products_response_dto.dart';

abstract class OccasionRemoteDataSource {
  Future<OccasionsResponseDTO> getOccasion();
  Future<ProductsResponseDTO> getOccasionDetails(String occasionId);
}

@Injectable(as: OccasionRemoteDataSource)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSource {
  final ApiClient _apiClient;
  OccasionRemoteDataSourceImpl(this._apiClient);

  @override
  Future<OccasionsResponseDTO> getOccasion() async {
    return await _apiClient.getOccasions();
  }

  @override
  Future<ProductsResponseDTO> getOccasionDetails(String occasionId) async {
    return await _apiClient.getProductsByOccasion(occasionId);
  }
}
