import 'package:flower_app/core/services/screen_size_service.dart';
import 'package:flower_app/core/utils/theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/routes_generator/pages_routes.dart';
import 'core/routes_generator/routes_generator.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/shared_preference_services.dart';
import 'di/injectable_initializer.dart';
import 'features/presentation/views/forget_passwerd/reset_password/reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   configureDependencies();
  MyBlocObserver();
  await SharedPreferenceServices.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeService.init(context);
    return MaterialApp(
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: PagesRoutes.resetPassword,
      builder: EasyLoading.init(),
    );
  }
}
