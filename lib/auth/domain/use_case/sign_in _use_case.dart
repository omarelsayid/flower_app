import 'package:flower_app/auth/domain/common/result.dart';
import 'package:flower_app/auth/domain/entity/sign_in_request.dart';
import 'package:flower_app/auth/domain/entity/sign_up_response_entity.dart';
import 'package:flower_app/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Result<SignUpResponseEntity>> execute(SignInRequest data) {
    return _authRepository.signIn(data);
  }
}
