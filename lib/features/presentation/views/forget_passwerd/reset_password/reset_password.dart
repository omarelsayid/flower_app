import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/extensions.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flower_app/features/presentation/manager/reset_password_cubit/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocListener, BlocProvider, ReadContext;

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  AutovalidateMode validateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   // email = ModalRoute.of(context)!.settings.arguments as String;

    // print("the email is $email");
    return BlocProvider(
      create: (context) => getIt<ResetPasswordViewModel>(),
      child: BlocListener<ResetPasswordViewModel, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
          else if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.response.message!), backgroundColor: Colors.green),
            );
            Navigator.pushReplacementNamed(context, PagesRoutes.signUpScreen);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          appBar: buildCustomAppBar(
            isVisible: false,
            context: context,
            title: "Password",
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
              vertical: kVerticalPadding,
            ),

            child: Form(
              autovalidateMode: validateMode,
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Reset password',
                        maxLines: 1,
                        style: AppTextStyles.inter500_18.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Password must not be empty and must contain 6 characters with upper case letter and one number at least ',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.inter400_14.copyWith(
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  buildFormFields(),
                  buildSubitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormFields() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: validateMode,
            validator: (value) {
              if (value == null || value.isEmpty == true) {
                return "The password empty ";
              }
              if (value.length < 8) {
                return "passwords can not be less than 8 characters";
              }
              if (!value.isValidPassword) {
                return "password must contain at least one upper case letter and one number";
              }
              return null;
            },
            onChanged: (value) {
              if (formKey.currentState!.validate()) {
                setState(() {
                  validateMode = AutovalidateMode.disabled;
                });
              } else {
                setState(() {
                  validateMode = AutovalidateMode.always;
                });
              }
            },
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'New Password',
              hintText: 'Enter your Password',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            autovalidateMode: validateMode,
            validator: (value) {
              if (value! != passwordController.text) {
                return 'passwords do not match';
              }
              return null;
            },
            onChanged: (value) {
              if (formKey.currentState!.validate()) {
                setState(() {
                  validateMode = AutovalidateMode.disabled;
                });
              } else {
                setState(() {
                  validateMode = AutovalidateMode.always;
                });
              }
            },
            controller: confirmPasswordController,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Confirm Password',
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildSubitButton() {
    return BlocBuilder<ResetPasswordViewModel, ResetPasswordState>(
      builder: (context, state) {
        if(state is ResetPasswordLoading)
          {
            return Center(child: CircularProgressIndicator(color: primaryColor,),);
          }
        else {
          return ElevatedButton(
            child: Text(
              'Continue',
              style: AppTextStyles.roboto500_16.copyWith(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
              validateMode == AutovalidateMode.disabled
                  ? primaryColor
                  : greyColor,
            ),

            onPressed: () {
              if (validateMode == AutovalidateMode.always) {
                null;
              } else {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    validateMode = AutovalidateMode.disabled;
                  });

                  context.read<ResetPasswordViewModel>().resetPassword(
                    "qwer353666@gmail.com",
                    confirmPasswordController.text.trim(),
                  );                } else {
                  setState(() {
                    validateMode = AutovalidateMode.always;
                  });
                }
              }
            },
          );
        }

      },
    );
  }
}
