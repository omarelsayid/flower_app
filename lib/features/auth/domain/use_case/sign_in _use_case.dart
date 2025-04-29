import 'package:flower_app/features/auth/domain/entity/sign_in_request.dart';
import 'package:flower_app/features/auth/domain/entity/sign_up_response_entity.dart';
import 'package:flower_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Result<SignUpResponseEntity>> execute(SignInRequest data) {
    return _authRepository.signIn(data);
  }
}
