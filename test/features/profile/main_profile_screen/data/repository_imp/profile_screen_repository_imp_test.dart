// import 'package:flower_app/core/common/result.dart';
// import 'package:flower_app/features/profile/main_profile_screen/data/data_source/profile_remote_data_source.dart';
// import 'package:flower_app/features/profile/main_profile_screen/data/model/profile_response_dto.dart';
// import 'package:flower_app/features/profile/main_profile_screen/data/repository_imp/profile_screen_repository_imp.dart';
// import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'profile_screen_repository_imp_test.mocks.dart';
//
// @GenerateMocks([ProfileRemoteDataSource])
// void main() {
//   late ProfileRemoteDataSource dataSource;
//   late ProfileRepositoryImpl repo;
//   setUp(() {
//     dataSource = MockProfileRemoteDataSource();
//     repo = ProfileRepositoryImpl(dataSource);
//   });
//
//   group('OccasionRepositoryImpl tests', () {
//
//     test("Should return getOccasion", () async {
//
//       var response = ProfileResponseDTO();
//
//       when(dataSource.getProfileData())
//           .thenAnswer((_) async => response);
//
//       var actual = await repo.getProfileData();
//
//       verify(dataSource.getProfileData()).called(1);
//
//       expect(actual, isA<Success<ProfileResponseEntity>>());
//
//     });
//
//     // test("Should return getProfileData", () async {
//     //   var result = Success<ProfileResponseEntity>(ProfileResponseEntity());
//     //   provideDummy<Result<ProfileResponseEntity>>(result);
//     //
//     //   when(repo.getProfileData()).thenAnswer((_) async=> result);
//     //
//     //   var actual = await repo.getProfileData();
//     //
//     //   verify(dataSource.getProfileData()).called(1);
//     //
//     //   expect(actual, equals(result));
//     // });
//   });
// }
//
//
//
