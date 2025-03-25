import '../repository/auth_repository.dart';
import '../entity/sign_up_request.dart';
import '../entity/sign_up_response_entity.dart';
import '../common/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
 final AuthRepository _authRepository;

 AuthUseCase(this._authRepository);

 Future<Result<User>> execute(SignUpRequest request) {
  return _authRepository.signUp(request);
 }
}
