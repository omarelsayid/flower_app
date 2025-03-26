import 'package:dio/dio.dart';
import 'package:flower_app/auth/data/data_source/auth_remote_data_source.dart';
import 'package:flower_app/auth/data/repository_imp/auth_repository_imp.dart';
import 'package:flower_app/auth/domain/common/result.dart';
import 'package:flower_app/auth/domain/entity/sign_up_request.dart';
import 'package:flower_app/auth/data/model/sign_up_response_dto.dart';
import 'package:flower_app/auth/domain/entity/sign_up_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_imp_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepositoryImpl authRepository;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    authRepository = AuthRepositoryImpl(mockAuthRemoteDataSource);
  });

  group('AuthRepositoryImpl signUp tests', () {
    final signUpRequest = SignUpRequest(
      email: "test@gmail.com",
      password: "Password123@",
      firstName: "name",
      lastName: "name",
      rePassword: "Password123@",
      phone: "+967777777777",
      gender: "male",
    );

    final signUpResponseDTO = SignUpResponseDTO(
      message: "success",
      token: "test_token",
      user: UserDTO(
        id: '1111',
        email: "test@gmail.com",
        firstName: "name",
        lastName: "name",
        phone: "+967777777777",
        gender: "male",
        addresses: [],
        photo: '',
        role: 'user',
        wishlist: [],
      ),
    );

    test("Should return Success when sign-up is successful", () async {
      when(mockAuthRemoteDataSource.signUp(signUpRequest))
          .thenAnswer((_) async => signUpResponseDTO);

      final result = await authRepository.signUp(signUpRequest);

      verify(mockAuthRemoteDataSource.signUp(signUpRequest)).called(1);
      expect(result, isA<Success<SignUpResponseEntity>>());
      expect((result as Success<SignUpResponseEntity>).data, isA<SignUpResponseDTO>());
    });

    test("Should return Error when sign-up fails", () async {
      final errorResponse = SignUpResponseDTO(message: "Error", token: null, user: null);
      when(mockAuthRemoteDataSource.signUp(signUpRequest))
          .thenAnswer((_) async => errorResponse);

      final result = await authRepository.signUp(signUpRequest);

      verify(mockAuthRemoteDataSource.signUp(signUpRequest)).called(1);
      expect(result, isA<Error>());
      expect((result as Error).exception, equals("Error"));
    });

    test("Should return Error when DioException occurs", () async {
      when(mockAuthRemoteDataSource.signUp(signUpRequest))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));
      final result = await authRepository.signUp(signUpRequest);

      verify(mockAuthRemoteDataSource.signUp(signUpRequest)).called(1);
      expect(result, isA<Error>());
      expect((result as Error).exception, equals("Unknown error"));
    });
  });
}



