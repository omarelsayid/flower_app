import 'package:flower_app/features/home/occasions/domain/entity/occasions_entity.dart';
import 'package:flower_app/features/home/occasions/domain/entity/products_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../repository/occasion_repository.dart';

@injectable
class OccasionUseCase {

 final OccasionRepository _occasionRepository;

 OccasionUseCase(this._occasionRepository);

 Future<Result<OccasionsResponseEntity>> execute() async{
  return await _occasionRepository.getOccasion();
 }
 Future<Result<ProductsResponseEntity>> executeSpecific(String occasionId) async{
  return await _occasionRepository.getSpecificOccasion(occasionId);

 }



}
