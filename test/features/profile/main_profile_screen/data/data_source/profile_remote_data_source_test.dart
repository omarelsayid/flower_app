// import 'package:flower_app/core/api/api_client.dart';
// import 'package:flower_app/features/profile/main_profile_screen/data/data_source/profile_remote_data_source.dart';
// import 'package:flower_app/features/profile/main_profile_screen/data/model/profile_response_dto.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'profile_remote_data_source_test.mocks.dart';
//
// @GenerateMocks([ApiClient])
// void main() {
//   late ProfileRemoteDataSource dataSource;
//   late ApiClient apiClient;
//   var profileResponse = ProfileResponseDTO(
//       user: UserDTO(
//         id: "1",
//         firstName: 'faten',
//         lastName: 'khalid',
//         phone: '+123456789',
//         gender: 'female',
//         email: 'test@example.com',
//         photo: 'test_image',
//         role: 'user',
//         wishlist: [],
//         addresses: [],
//       ),
//   );
//
//   setUp(() {
//     apiClient = MockApiClient();
//     dataSource = ProfileRemoteDataSourceImpl(apiClient);
//   });
//
//   group('profile data source tests', () {
//
//     test("when call getProfileData then "
//         "It should return getProfileData from api"
//         "and return correct output ", () async {
//
//       when(apiClient.getProfileData())
//           .thenAnswer((_) async => profileResponse);
//
//       var actual = await dataSource.getProfileData();
//
//       verify(apiClient.getProfileData()).called(1);
//
//       expect(actual, profileResponse);
//     }
//     );
//   });
// }