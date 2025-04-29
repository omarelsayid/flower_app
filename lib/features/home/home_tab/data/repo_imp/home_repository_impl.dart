import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/core/error/failures.dart';
import 'package:flower_app/features/home/home_tab/data/data_source/home_data_source.dart';
import 'package:flower_app/features/home/home_tab/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/common/result.dart';
import '../../domain/entity/category_entity.dart';

@Injectable(as: HomeRepo)
class HomeRepositoryImpl implements HomeRepo {
  final HomeDataSource dataSource;
  // final InternetConnectionChecker internetConnectionChecker;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<MasterEntity>>> getCategories() async {
    return await executeApi(() async {
      final categoryResponseDTO = await dataSource.getAllCategories();
      final categories =
          categoryResponseDTO.categories.map((dto) {
            return MasterEntity(
              id: dto.id,
              name: dto.name,
              slug: dto.slug,
              image: dto.image,
              createdAt: dto.createdAt,
              updatedAt: dto.updatedAt,
              productsCount: dto.productsCount,
            );
          }).toList();
      return categories;
    });
  }
  // try {
  //   bool isConnected = await InternetConnectionChecker.instance.hasConnection;
  //   if (isConnected) {
  //     final categoryResponseDTO = await dataSource.getAllCategories();
  //     // map category model to category entity
  //
  //     if (categoryResponseDTO.message == "success") {
  //       final categories =
  //           categoryResponseDTO.categories.map((dto) {
  //             return MasterEntity(
  //               id: dto.id,
  //               name: dto.name,
  //               slug: dto.slug,
  //               image: dto.image,
  //               createdAt: dto.createdAt,
  //               updatedAt: dto.updatedAt,
  //               productsCount: dto.productsCount,
  //             );
  //           }).toList();
  //
  //       return Success(categories);
  //     } else {
  //       return Error(categoryResponseDTO.error ?? "");
  //     }
  //   } else {
  //     return Error(
  //       "Please check your internet connection and try again later",
  //     );
  //   }
  // } on DioException catch (dioExep) {
  //   return Error(
  //     ServerFailure.fromDioException(dioExep).errorMessage.toString(),
  //   );
  // } catch (e) {
  //   return Error(
  //     ServerFailure(errorMessage: e.toString()).errorMessage.toString(),
  //   );
  // }

  @override
  Future<Result<List<MasterEntity>>> getOccasion() async {
    return await executeApi(() async {
      final occasionResponseDTO = await dataSource.getOccasion();
      final occasion =
          occasionResponseDTO.occasions.map((dto) {
            return MasterEntity(
              id: dto.id,
              name: dto.name,
              slug: dto.slug,
              image: dto.image,
              createdAt: dto.createdAt,
              updatedAt: dto.updatedAt,
              productsCount: dto.productsCount,
            );
          }).toList();
      return occasion;
    });
  }

  // try {
  //   bool isConnected = await InternetConnectionChecker.instance.hasConnection;
  //   if (isConnected) {
  //     final occasionResponseDTO = await dataSource.getOccasion();
  //     log("i am in the rpo imp");
  //     if (occasionResponseDTO.message == "success") {
  //       log("i am in the rpo imp");
  //       final occasion =
  //           occasionResponseDTO.occasions.map((dto) {
  //             return MasterEntity(
  //               id: dto.id,
  //               name: dto.name,
  //               slug: dto.slug,
  //               image: dto.image,
  //               createdAt: dto.createdAt,
  //               updatedAt: dto.updatedAt,
  //               productsCount: dto.productsCount,
  //             );
  //           }).toList();
  //
  //       return Success(occasion);
  //     } else {
  //       return Error(occasionResponseDTO.error ?? "");
  //     }
  //   } else {
  //     return Error(
  //       "Please check your internet connection and try again later",
  //     );
  //   }
  // } on DioException catch (dioExep) {
  //   return Error(
  //     ServerFailure.fromDioException(dioExep).errorMessage.toString(),
  //   );
  // } catch (e) {
  //   return Error(
  //     ServerFailure(errorMessage: e.toString()).errorMessage.toString(),
  //   );
  // }
}
