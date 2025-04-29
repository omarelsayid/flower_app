import 'dart:developer';

import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/features/home/home_tab/data/model/occasion_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../model/category_response_dto.dart';

abstract class HomeDataSource {
  Future<CategoryResponseDTO> getAllCategories();
  Future<OccasionResponseDTO> getOccasion();
}

@Injectable(as: HomeDataSource)
class CategoryDataSourceImp implements HomeDataSource {
  final ApiClient _apiClient;

  CategoryDataSourceImp(this._apiClient);

  @override
  Future<CategoryResponseDTO> getAllCategories() async {
    final response = await _apiClient.getCategories();

    log("Category from data source");
    return response;
  }

  @override
  Future<OccasionResponseDTO> getOccasion() async {
    final response = await _apiClient.getOccasion();
    log("Category from data source");
    return response;
  }
}
