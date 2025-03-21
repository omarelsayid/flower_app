import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/features/presentation/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => const SignUpScreen(), settings: settings);


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
        body: const Center(
          child: Text("Un defined route"),
        ),
      );
    },
  );
}
