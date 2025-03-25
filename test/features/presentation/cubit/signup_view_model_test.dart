import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/auth/domain/common/result.dart';
import 'package:flower_app/auth/domain/entity/sign_up_request.dart';
import 'package:flower_app/auth/domain/entity/sign_up_response_entity.dart';
import 'package:flower_app/auth/domain/use_case/auth_use_case.dart';
import 'package:flower_app/auth/presentation/cubit/signup_state.dart';
import 'package:flower_app/auth/presentation/cubit/signup_view_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthUseCase extends Mock implements AuthUseCase {}
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SignUpViewModel viewModel;
  late MockAuthUseCase mockAuthUseCase;

  setUpAll(() {
    registerFallbackValue(SignUpRequest(
      firstName: 'faten',
      lastName: 'khalid',
      phone: '+967777777777',
      email: 'faten@gmail.com',
      password: 'ASDasd@123',
      rePassword: 'ASDasd@123',
      gender: 'female',
    ));
  });

  setUp(() {
    mockAuthUseCase = MockAuthUseCase();
    viewModel = SignUpViewModel(mockAuthUseCase);
  });

  test('should show error when passwords do not match', () async {
    viewModel.passwordController.text = 'ASDasd@123';
    viewModel.rePasswordController.text = 'ASDasd@1233';

    viewModel.doIntent(SignUpClickedIntent());

    expect(EasyLoading.isShow, isTrue);
    EasyLoading.showToast("Passwords do not match");
  });

  blocTest<SignUpViewModel, SignUpState>(
    'should call _authUseCase.execute() on sign up success',
    build: () {
      when(() => mockAuthUseCase.execute(any()))
          .thenAnswer((_) async => Success(SignUpResponseEntity(user: User(firstName: 'faten', lastName: 'khalid'), token: 'valid_token')));

      viewModel.emailController.text = 'faten@gmail.com';
      viewModel.passwordController.text = 'ASDasd@123';
      viewModel.rePasswordController.text = 'ASDasd@123';

      return viewModel;
    },
    act: (viewModel) {
      return viewModel.doIntent(SignUpClickedIntent());
    },
    expect: () => [
      SuccessSignUpState(User(firstName: 'faten', lastName: 'khalid'), 'valid_token')
    ],
    verify: (_) {
      verify(() => mockAuthUseCase.execute(any())).called(1);
    },
  );

  blocTest<SignUpViewModel, SignUpState>(
    'should show error when sign up fails',
    build: () {
      when(() => mockAuthUseCase.execute(any()))
          .thenAnswer((_) async => Error('Something went wrong'));

      viewModel.emailController.text = 'faten@gmail.com';
      viewModel.passwordController.text = 'ASDasd@123';
      viewModel.rePasswordController.text = 'ASDasd@123';

      return viewModel;
    },
    act: (viewModel) {
      return viewModel.doIntent(SignUpClickedIntent());
    },
    expect: () => [
      SignUpErrorState('Something went wrong')
    ],
    verify: (_) {
      verify(() => mockAuthUseCase.execute(any())).called(1);
    },
  );
}



