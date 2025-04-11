import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
  await SharedPreferenceServices.init();

  ConfigLoading().showLoading();

  String? token = SharedPreferenceServices.getData(AppConstants.token) as String?;
  bool? rememberMe = SharedPreferenceServices.getData(AppConstants.rememberMe) as bool?;

  runApp(MainApp(token: token, rememberMe: rememberMe));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, this.token, this.rememberMe});

  final String? token;
  final bool? rememberMe;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Builder(
        builder: (context) {
          final localeProvider = context.watch<LocaleProvider>();

          return LayoutBuilder(
            builder: (context, constraints) {
              ScreenSizeService.init(context);

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme(), // 👈 no context
                locale: localeProvider.locale,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                onGenerateRoute: RoutesGenerator.onGenerateRoute,
                initialRoute: token != null && (rememberMe ?? false)
                    ? PagesRoutes.layOutScreen
                    : PagesRoutes.signInScreen,
              );
            },
          );
        },
      ),
    );
  }
}
