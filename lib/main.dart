import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'fcm_notif.dart';
import 'generated/l10n.dart';
import 'core/routes_generator/pages_routes.dart';
import 'core/routes_generator/routes_generator.dart';
import 'core/di/injectable_initializer.dart';
import 'firebase_options.dart';

// Background message handler (must be a top-level function)
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled
  // by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Firebase Message
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FCM().init();

  // App Config
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
      initialRoute:
      (SharedPreferenceServices.getData(AppConstants.token) != null &&
          (SharedPreferenceServices.getData(AppConstants.rememberMe)
          as bool? ??
              false))
          ? PagesRoutes.layOutScreen
          : PagesRoutes.signInScreen,
      builder: (context, child) => child!,
    );
  }
}
