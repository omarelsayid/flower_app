import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'core/services/localization_service.dart';
import 'core/services/screen_size_service.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/easy_loading_service.dart';
import 'core/services/shared_preference_services.dart';
import 'core/utils/constant_manager.dart';
import 'core/utils/theming.dart';
import 'generated/l10n.dart';
import 'core/routes_generator/pages_routes.dart';
import 'core/routes_generator/routes_generator.dart';
import 'di/injectable_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ConfigLoading().showLoading();
  await SharedPreferenceServices.init();

  // Retrieve token and rememberMe flag from shared preferences
  String? token =
      SharedPreferenceServices.getData(AppConstants.token) as String?;
  bool? rememberMe =
      SharedPreferenceServices.getData(AppConstants.rememberMe) as bool?;

  // Run the app starting with PreInitApp that provides a valid MediaQuery context
  runApp(PreInitApp(token: token, rememberMe: rememberMe));
}

class PreInitApp extends StatelessWidget {
  final String? token;
  final bool? rememberMe;

  const PreInitApp({Key? key, this.token, this.rememberMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This MaterialApp creates the necessary MediaQuery context for initialization.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Use a Builder to get a new BuildContext where MediaQuery is available.
      home: Builder(
        builder: (context) {
          // Initialize ScreenSizeService once using this context.
          ScreenSizeService.init(context);

          // Provide your app-level providers (like localization) here.
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ],
            child: const MainAppContent(),
          );
        },
      ),
      // Initialize EasyLoading globally.
      builder: EasyLoading.init(),
    );
  }
}

class MainAppContent extends StatelessWidget {
  const MainAppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Now that ScreenSizeService is initialized, theme() which might depend
    // on ScreenSizeService.width/height will not throw an error.
    final localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(), // Safe to use ScreenSizeService.width here.
      locale: localeProvider.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute:
          (SharedPreferenceServices.getData(AppConstants.token) != null &&
                  (SharedPreferenceServices.getData(AppConstants.rememberMe)
                          as bool? ??
                      false))
              ? PagesRoutes.layOutScreen
              : PagesRoutes.signInScreen,
      // Wrap with EasyLoading to ensure overlays work.
      builder: EasyLoading.init(builder: (context, child) => child!),
    );
  }
}
