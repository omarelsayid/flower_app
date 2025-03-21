import 'package:flower_app/core/services/screen_size_service.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/utils/theming.dart';
import 'package:flower_app/core/widgets/custom_app_bar.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildCustomAppBar(
          title: 'Login',
          isVisible: false,
          context: context,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'login',
                  style: AppTextStyles.inter500_16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              TextFormField(),
              TextButton(onPressed: () {}, child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
