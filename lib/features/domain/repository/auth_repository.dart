import 'package:flower_app/features/domain/entity/sign_in_request.dart';

import '../entity/sign_up_request.dart';
import '../entity/sign_up_response_entity.dart';
import '../common/result.dart';

abstract class AuthRepository {
  Future<Result<User>> signUp(SignUpRequest data);
  Future<Result<SignUpResponseEntity>> signIn(SignInRequest data);
}
