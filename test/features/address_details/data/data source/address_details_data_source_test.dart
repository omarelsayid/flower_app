import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flower_app/features/address_details/data/models/address_details_model.dart';
import 'package:flower_app/features/address_details/data/data_source/address_details_data_source_imp.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:mockito/mockito.dart';
import 'package:flower_app/core/api/api_client.dart';

// import '../../../profile/main_profile_screen/data/data_source/profile_remote_data_source_test.mocks.dart';
import 'address_details_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late AddressDetailsDataSourceImp dataSource;

  final dummyAddress = AddressDetailsModel(
    userName: 'omar',
    city: 'Alexandria',
    street: 'Example Street',
    phone: '0123456789',
    lat: '31.2001',
    long: '29.9187',
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    SharedPreferences.setMockInitialValues({});

    await SharedPreferenceServices.init();
  });

  setUp(() async {
    mockApiClient = MockApiClient();
    dataSource = AddressDetailsDataSourceImp(mockApiClient);

    await SharedPreferenceServices.saveData(
      AppConstants.token.toString(),
      'test_token',
    );
  });

  test('calls ApiClient with bearer token and address model', () async {
    when(mockApiClient.saveUserAddress(any, any))
        .thenAnswer((_) async => Future.value());

    await dataSource.saveAddressDetails(dummyAddress);

    verify(mockApiClient.saveUserAddress("Bearer test_token", dummyAddress))
        .called(1);
  });
}
