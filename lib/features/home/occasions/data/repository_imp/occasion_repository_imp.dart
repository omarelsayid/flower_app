import 'package:flower_app/core/api/api_execute.dart';
import 'package:flower_app/features/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/features/home/occasions/domain/entity/products_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/result.dart';
import '../../domain/repository/occasion_repository.dart';
import '../data_source/occasion_remote_data_source.dart';

@Injectable(as: OccasionRepository)
class OccasionRepositoryImpl implements OccasionRepository {
  final OccasionRemoteDataSource _occasionRemoteDataSource;

  OccasionRepositoryImpl(
    this._occasionRemoteDataSource,
    // this.internetConnectionChecker,
  );

  @override
  Future<Result<OccasionsResponseEntity>> getOccasion() async {
    return executeApi(() async {
      var data = await _occasionRemoteDataSource.getOccasion();
      return data;
    });
  }

  @override
  Future<Result<ProductsResponseEntity>> getSpecificOccasion(
    String occasionId,
  ) {
    return executeApi(() async {
      var data = await _occasionRemoteDataSource.getOccasionDetails(occasionId);
      return data;
    });
  }
}
