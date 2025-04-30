import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/repository/profile_screen_repository.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/profile_screen_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_screen_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late ProfileUseCase useCase;
  late ProfileRepository repo;

  setUp(() {
    repo = MockProfileRepository();
    useCase = ProfileUseCase(repo);
  });

  group('Occasion use case test', () {
    test(
      "when call execute from use case it should call getProfileData from repo", () async {
      var result = Success<ProfileResponseEntity>(ProfileResponseEntity());
      provideDummy<Result<ProfileResponseEntity>>(result);

      when(repo.getProfileData()).thenAnswer((_) async=> result);


      var actual = await useCase.execute();

      verify(repo.getProfileData()).called(1);

      expect(actual, equals(result));
    },
    );


  });
}




