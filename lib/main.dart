import 'package:flower_app/core/services/screen_size_service.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/utils/theming.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeService.init(context);
    return MaterialApp(
      theme: theme(context),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'login',
              style: AppTextStyles.inter500_16.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
