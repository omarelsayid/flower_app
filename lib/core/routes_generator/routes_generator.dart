import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/auth/presentation/views/sign_in_screen.dart';
import 'package:flower_app/auth/presentation/views/sign_up_screen.dart';
import 'package:flower_app/layout/presentation/layout_screen.dart';
import 'package:flower_app/features/presentation/views/forget_passwerd/forget_paswerd_screen.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/views/forget_passwerd/email_verification_screen.dart';
import '../../features/presentation/views/forget_passwerd/reset_password/reset_password.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: settings,
        );
      case PagesRoutes.signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
          settings: settings,
        );
      case PagesRoutes.layOutScreen:
        return MaterialPageRoute(
          builder: (context) => LayoutScreen(),
          settings: settings,
        );

      case PagesRoutes.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen(), settings: settings);
      case PagesRoutes.emailVerification:
        return MaterialPageRoute(
            builder: (context) => const EmailVerificationsScreen(), settings: settings);

      case PagesRoutes.resetPassword:
        return MaterialPageRoute(builder: (_)=>ResetPassword(),settings: settings);
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}
