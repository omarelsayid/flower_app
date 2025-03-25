import 'package:flower_app/features/data/model/sign_up_response_dto.dart';
import 'package:flower_app/features/domain/common/result.dart';
import 'package:flower_app/features/domain/entity/sign_up_request.dart';
import 'package:flower_app/features/domain/entity/sign_up_response_entity.dart';
import 'package:flower_app/features/domain/repository/auth_repository.dart';
import 'package:flower_app/features/domain/use_case/auth_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
    late AuthUseCase useCase;
    late AuthRepository repo;

    setUp(() {
        repo = MockAuthRepository();
        useCase = AuthUseCase(repo);

        provideDummy<Result<SignUpResponseEntity>>(
            Success<SignUpResponseEntity>(
                SignUpResponseDTO(
                    message: 'success',
                    token: 'test_token',
                    user: UserDTO(
                        firstName: 'faten',
                        lastName: 'khalid',
                        email: 'faten@gmail.com',
                        phone: '+967777777777',
                        gender: 'female',
                    ),
                ),
            ),
        );
    });

    group('Auth use case test', () {
        test(
            "when call execute from use case it should call sign up from repo", () async {
            var signUpRequest = SignUpRequest(
                firstName: 'faten',
                lastName: 'khalid',
                email: 'faten@gmail.com',
                phone: '+967777777777',
                gender: 'female',
                password: 'ASDasd@123',
                rePassword: 'ASDasd@123',
            );

            var result = Success<SignUpResponseEntity>(
                SignUpResponseDTO(
                    message: 'success',
                    token: 'test_token',
                    user: UserDTO(
                        firstName: 'faten',
                        lastName: 'khalid',
                        email: 'faten@gmail.com',
                        phone: '+967777777777',
                        gender: 'female',
                    ),
                ),
            );

            when(repo.signUp(signUpRequest)).thenAnswer((_) async => result);

            var actual = await useCase.execute(signUpRequest);

            verify(repo.signUp(signUpRequest)).called(1);

            expect(actual, equals(result));
        },
        );
    });
}




