import 'package:dio/dio.dart';
import 'package:flower_app/di/injectable_initializer.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.init();
}
