import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/constant_manager.dart';

abstract class ProfileLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheToken(String token) async {
    await sharedPreferences.setString(AppConstants.token, token);
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.token);
  }

  @override
  Future<void> deleteToken() async {
    await sharedPreferences.remove(AppConstants.token);
  }
}
