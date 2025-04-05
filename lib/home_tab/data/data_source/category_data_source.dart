

import 'dart:developer';

import 'package:flower_app/core/api/api_client.dart';
import 'package:injectable/injectable.dart';

import '../model/category_response_dto.dart';

abstract class CategoryDataSource{

  Future<CategoryResponseDTO> getAllCategories();
}



@Injectable(as: CategoryDataSource)
class CategoryDataSourceImp implements  CategoryDataSource{
  final ApiClient _apiClient;

  CategoryDataSourceImp(this._apiClient);

  @override
  Future<CategoryResponseDTO> getAllCategories() async{

      final response=await _apiClient.getCategories();

      log("Category from data source");
      return response;
  }


}

