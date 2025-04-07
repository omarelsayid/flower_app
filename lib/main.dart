import 'package:flower_app/core/services/screen_size_service.dart';
import 'package:flower_app/core/utils/theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/routes_generator/pages_routes.dart';
import 'core/routes_generator/routes_generator.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/easy_loading_service.dart';
import 'core/services/shared_preference_services.dart';
import 'core/utils/constant_manager.dart';
import 'di/injectable_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  MyBlocObserver();
  await SharedPreferenceServices.init();
  ConfigLoading().showLoading();
  String? token =
      SharedPreferenceServices.getData(AppConstants.token) as String?;
  bool? rememberMe =
      SharedPreferenceServices.getData(AppConstants.rememberMe) as bool?;
  runApp(MainApp(token: token, rememberMe: rememberMe));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, this.token, this.rememberMe});
  final String? token;
  final bool? rememberMe;

  @override
  Widget build(BuildContext context) {
    ScreenSizeService.init(context);
    return MaterialApp(
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute:PagesRoutes.layOutScreen,
          // token != null && (rememberMe ?? false)
          //     ? PagesRoutes.layOutScreen
          //     : PagesRoutes.signInScreen,
      builder: EasyLoading.init(),
    );
  }
}
