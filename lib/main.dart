import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'core/di/injectable_initializer.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ConfigLoading().showLoading();
  await SharedPreferenceServices.init();

  String? token =
      SharedPreferenceServices.getData(AppConstants.token) as String?;
  bool? rememberMe =
      SharedPreferenceServices.getData(AppConstants.rememberMe) as bool?;

  runApp(PreInitApp(token: token, rememberMe: rememberMe));
}

class PreInitApp extends StatelessWidget {
  final String? token;
  final bool? rememberMe;

  const PreInitApp({Key? key, this.token, this.rememberMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          ScreenSizeService.init(context);

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
    final localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      locale: localeProvider.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: PagesRoutes.addressScreen,
      // (SharedPreferenceServices.getData(AppConstants.token) != null &&
      //         (SharedPreferenceServices.getData(AppConstants.rememberMe)
      //                 as bool? ??
      //             false))
      //     ? PagesRoutes.layOutScreen
      //     : PagesRoutes.signInScreen,
      builder: (context, child) => child!,
    );
  }
}
