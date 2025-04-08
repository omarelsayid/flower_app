import 'package:flower_app/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/home/occasions/domain/entity/products_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../repository/occasion_repository.dart';

@injectable
class OccasionUseCase {

 final OccasionRepository _occasionRepository;

 OccasionUseCase(this._occasionRepository);

 Future<Result<OccasionsResponseEntity>> execute() {
  return _occasionRepository.getOccasion();
 }
 Future<Result<ProductsResponseEntity>> executeSpecific(String occasionId) {
  return _occasionRepository.getSpecificOccasion(occasionId);
 }

}
