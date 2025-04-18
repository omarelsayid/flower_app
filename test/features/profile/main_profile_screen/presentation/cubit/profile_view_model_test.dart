/// when edit to be able use shared preference in correct way
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
// import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/profile_screen_use_case.dart';
// import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_view_model.dart';
// import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_state.dart';
// import 'package:flower_app/core/common/result.dart';
// import 'package:flower_app/core/services/shared_preference_services.dart';
// import 'package:flower_app/core/utils/constant_manager.dart';
//
// import 'profile_view_model_test.mocks.dart';
//
// @GenerateMocks([ProfileUseCase, SharedPreferenceServices])
// void main() {
//   late MockProfileUseCase mockUseCase;
//   late MockSharedPreferenceServices mockSharedPref;
//
//   setUp(() {
//     mockUseCase = MockProfileUseCase();
//     mockSharedPref = MockSharedPreferenceServices();
//   });
//
//   group('ProfileViewModel Tests', () {
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [Loading, Success with guest] when token is null',
//       build: () {
//         when(mockSharedPref.getData(AppConstants.token)).thenAnswer((_) async => null);
//         return ProfileViewModel(mockUseCase, mockSharedPref);
//       },
//       act: (cubit) => cubit.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         isA<LoadingProfileState>(),
//         isA<SuccessProfileState>()
//             .having((s) => s.user?.firstName, 'firstName', 'Guest User'),
//       ],
//     );
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [Loading, Success with user data] when token exists and API succeeds',
//       build: () {
//         final user = UserEntity(firstName: 'Ali', email: 'ali@gmail.com');
//         final profile = ProfileResponseEntity(user: user);
//
//         when(mockSharedPref.getData(AppConstants.token)).thenAnswer((_) async => 'valid_token');
//         when(mockUseCase.execute()).thenAnswer((_) async => Success(profile));
//
//         return ProfileViewModel(mockUseCase, mockSharedPref);
//       },
//       act: (cubit) => cubit.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         isA<LoadingProfileState>(),
//         isA<SuccessProfileState>()
//             .having((s) => s.user?.firstName, 'firstName', 'Ali'),
//       ],
//     );
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [Loading, Error] when token exists and API fails',
//       build: () {
//         when(mockSharedPref.getData(AppConstants.token)).thenAnswer((_) async => 'valid_token');
//         when(mockUseCase.execute()).thenAnswer((_) async => Error('Something went wrong'));
//
//         return ProfileViewModel(mockUseCase, mockSharedPref);
//       },
//       act: (cubit) => cubit.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         isA<LoadingProfileState>(),
//         isA<ErrorProfileState>()
//             .having((s) => s.message, 'message', contains('Exception')),
//       ],
//     );
//   });
// }
///do not return true
library;
import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_view_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/profile_screen_use_case.dart';
import 'package:flower_app/core/common/result.dart';

import 'profile_view_model_test.mocks.dart';
@GenerateMocks([ProfileUseCase])
void main() {
  late MockProfileUseCase mockProfileUseCase;
  late ProfileViewModel profileViewModel;

  setUp(() {
    mockProfileUseCase = MockProfileUseCase();
    profileViewModel = ProfileViewModel(mockProfileUseCase, );
  });

  group('ProfileViewModel Tests', () {
    blocTest<ProfileViewModel, ProfileState>(
      'emits [LoadingProfileState, SuccessProfileState] when ProfileUseCase returns a profile',
      build: () {
        when(mockProfileUseCase.execute()).thenAnswer(
              (_) async => Success(ProfileResponseEntity(user: UserEntity(firstName: 'John', email: 'john@example.com'))),
        );
        return profileViewModel;
      },
      act: (viewModel) => viewModel.doIntent(ProfileClickedIntent()),
      expect: () => [
        LoadingProfileState(),
        SuccessProfileState(UserEntity(firstName: 'John', email: 'john@example.com')),
      ],
    );

    blocTest<ProfileViewModel, ProfileState>(
      'emits [LoadingProfileState, ErrorProfileState] when ProfileUseCase returns an error',
      build: () {
        when(mockProfileUseCase.execute()).thenAnswer(
              (_) async => Error('Profile fetch failed'),
        );
        return profileViewModel;
      },
      act: (viewModel) => viewModel.doIntent(ProfileClickedIntent()),
      expect: () => [
        LoadingProfileState(),
        ErrorProfileState('Profile fetch failed'),
      ],
    );
  });
}

