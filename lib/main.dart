import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/utils/theming.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(context),
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'login',
             
            ),
          ),
        ),
      ),
    );
  }
}
