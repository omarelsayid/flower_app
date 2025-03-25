import 'package:flower_app/core/api/api_client.dart';
import 'package:flower_app/auth/data/data_source/auth_remote_data_source.dart';
import 'package:flower_app/auth/data/model/sign_up_response_dto.dart';
import 'package:flower_app/auth/domain/entity/sign_up_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late AuthRemoteDataSourceImpl authRemoteDataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    authRemoteDataSource = AuthRemoteDataSourceImpl(mockApiClient);
  });

  test('Should sign up user and return response', () async {
    final signUpRequest = SignUpRequest(
      email: 'test@gmail.com',
      password: 'Password#123',
      firstName: 'faten',
      lastName: 'khalid',
      rePassword:'Password#123',
      phone: '+96777777777',
      gender: 'female',
    );

    final signUpResponse = SignUpResponseDTO(
      message: 'success',
      token: 'test_token',
      user: UserDTO(
        id: '1111',
        email: 'test@gmail.com',
        firstName: 'faten',
        lastName: 'khalid',
        phone: '+96777777777',
        gender: 'female',
        photo: '',
        role: 'user',
        wishlist: [],
      ),
    );

    when(mockApiClient.signUp(signUpRequest)).thenAnswer(
          (_) async => signUpResponse,
    );
    final actual = await authRemoteDataSource.signUp(signUpRequest);
    verify(mockApiClient.signUp(signUpRequest)).called(1);
    expect(actual, signUpResponse);
  });
}
