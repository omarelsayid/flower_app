import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/features/presentation/views/widgets/sign_up_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/routes_generator/pages_routes.dart';
import '../cubit/signup_view_model.dart';
import '../cubit/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpViewModel>(),
      child: BlocListener<SignUpViewModel, SignUpState>(
        listener: (context, state) async {
          if (state is SuccessSignUpState) {
            await SharedPreferenceServices.saveData(AppConstants.token, state.token);
            debugPrint("+++++Saved token+++++++: ${state.token}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Signup successful!")),
            );
            Navigator.pushNamed(context, PagesRoutes.signInScreen);
          } else if (state is SignUpErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              // SnackBar(content: Text("Signup failed: ${state.message}")),
              SnackBar(content: Text("Signup failed")),
            );
          } else if (state is SignUpLoadingState) {
            EasyLoading.show();
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Sign up")),
          body: BlocBuilder<SignUpViewModel, SignUpState>(
            builder: (context, state) {
              final cubit = context.read<SignUpViewModel>();
              return SignUpFormWidget(vmSignUp: cubit);
            },
          ),
        ),
      ),
    );
  }
}