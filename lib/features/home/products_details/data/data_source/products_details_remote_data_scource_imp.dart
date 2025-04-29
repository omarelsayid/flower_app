import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/features/home/products_details/data/data_source/products_details_remote_data_scource.dart';
import 'package:flower_app/features/home/products_details/data/models/products_details_models.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

@Injectable(as: ProductsDetailsRemoteDataScource)
class ProductsDetailsRemoteDataScourceImp
    implements ProductsDetailsRemoteDataScource {
  final ApiClient _apiClient;

  ProductsDetailsRemoteDataScourceImp(this._apiClient);
  @override
  Future<ProductsDetailsModels> getProductDetails(String id) async {
    HttpResponse<ProductsDetailsModels> response = await _apiClient
        .getProductDetails(id);
    return response.data;
  }
}
