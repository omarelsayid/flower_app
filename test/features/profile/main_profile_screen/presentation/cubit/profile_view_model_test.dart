//
// library;
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_state.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_view_model.dart';
// import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
// import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/profile_screen_use_case.dart';
// import 'package:flower_app/core/common/result.dart';
//
// import 'profile_view_model_test.mocks.dart';
// @GenerateMocks([ProfileUseCase])
// void main() {
//   late MockProfileUseCase mockProfileUseCase;
//   late ProfileViewModel profileViewModel;
//
//   setUp(() {
//     mockProfileUseCase = MockProfileUseCase();
//     profileViewModel = ProfileViewModel(mockProfileUseCase );
//   });
//
//   group('ProfileViewModel Tests', () {
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [LoadingProfileState, SuccessProfileState] when ProfileUseCase returns a profile',
//       build: () {
//         when(mockProfileUseCase.execute()).thenAnswer(
//               (_) async => Success(ProfileResponseEntity(user: UserEntity(firstName: 'John', email: 'john@example.com'))),
//         );
//         return profileViewModel;
//       },
//       act: (viewModel) => viewModel.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         LoadingProfileState(),
//         SuccessProfileState(UserEntity(firstName: 'John', email: 'john@example.com')),
//       ],
//     );
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [LoadingProfileState, ErrorProfileState] when ProfileUseCase returns an error',
//       build: () {
//         when(mockProfileUseCase.execute()).thenAnswer(
//               (_) async => Error('Profile fetch failed'),
//         );
//         return profileViewModel;
//       },
//       act: (viewModel) => viewModel.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         LoadingProfileState(),
//         ErrorProfileState('Profile fetch failed'),
//       ],
//     );
//   });
// }
//
// //
