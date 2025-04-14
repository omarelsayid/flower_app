import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../entity/profile_response_entity.dart';
import '../repository/profile_screen_repository.dart';

@injectable
class ProfileUseCase {

 final ProfileRepository _profileRepository;

 ProfileUseCase(this._profileRepository);

 Future<Result<ProfileResponseEntity>> execute() async{
  return await _profileRepository.getProfileData();
 }

}
