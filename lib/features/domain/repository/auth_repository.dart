import '../entity/sign_up_request.dart';
import '../entity/sign_up_response_entity.dart';
import '../common/result.dart';

abstract class AuthRepository {
  Future<Result<SignUpResponseEntity>> signUp(SignUpRequest data);
}
