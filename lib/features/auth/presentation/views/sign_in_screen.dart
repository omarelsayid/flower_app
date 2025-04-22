import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart';
import 'package:flower_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  SignInViewModel signInViewModel = getIt.get<SignInViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).signIn)),
      body: SignInViewBody(signInViewModel: signInViewModel),
    );
  }
}
