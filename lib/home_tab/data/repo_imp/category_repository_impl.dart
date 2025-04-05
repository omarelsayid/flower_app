
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_app/core/error/failures.dart';
import 'package:flower_app/home_tab/data/data_source/category_data_source.dart';
import 'package:flower_app/home_tab/domain/repo/category_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/common/result.dart';
import '../../domain/entity/category_entity.dart';

@Injectable(as:CategoryRepo )
class CategoryRepositoryImpl implements CategoryRepo{

  final CategoryDataSource dataSource;
  final InternetConnectionChecker internetConnectionChecker;



  CategoryRepositoryImpl(this.dataSource,this.internetConnectionChecker);

  @override

    Future<Result<List<CategoryEntity>>> getCategories() async {
      try {

        bool isConnected = await internetConnectionChecker.hasConnection;
        if(isConnected){
          final categoryResponseDTO = await dataSource.getAllCategories();
          // map category model to category entity

          if(categoryResponseDTO.message == "success")
            {
              final categories = categoryResponseDTO.categories.map((dto) {
                return CategoryEntity(
                  id: dto.id,
                  name: dto.name,
                  slug: dto.slug,
                  image: dto.image,
                  createdAt: dto.createdAt,
                  updatedAt: dto.updatedAt,
                  productsCount: dto.productsCount,
                );
              }).toList();

              return Success(categories);
            }else {

            return Error(categoryResponseDTO.error??"");
          }
        }else{
          return Error(
            "Please check your internet connection and try again later",
          );
        }
      } on DioException catch (dioExep) {
        return Error(ServerFailure.fromDioException(dioExep).errorMessage.toString());
      }catch(e)
    {
      return Error(ServerFailure(errorMessage: e.toString()).errorMessage.toString());

    }
    }

}