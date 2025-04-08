import 'package:flower_app/best_seller_products/data/data_source/best_seller_remote_data_source.dart';
import 'package:flower_app/best_seller_products/data/model/BestSellerProductsModel.dart';
import 'package:flower_app/core/api/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';

@Injectable(as: BestSellerRemoteDataSource)
class BestSellerRemoteDataSourceImpl implements BestSellerRemoteDataSource {
  final ApiClient _apiClient;
  BestSellerRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BestSellerProductsModel> getBestSeller() async {
    HttpResponse<BestSellerProductsModel> response =
        await _apiClient.getBestSeller();

    return response.data;
  }
}
