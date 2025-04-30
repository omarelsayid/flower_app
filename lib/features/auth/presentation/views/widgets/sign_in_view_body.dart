import 'dart:developer';

import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/constans.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/core/utils/extensions.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/features/auth/domain/entity/sign_in_request.dart';
import 'package:flower_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:flower_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart';
import 'package:flower_app/features/auth/presentation/views/widgets/no_have_account_widget.dart';
import 'package:flower_app/features/auth/presentation/views/widgets/remember_me_widget.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/services/shared_preference_services.dart';

class SignInViewBody extends StatefulWidget {
  final SignInViewModel signInViewModel;

  const SignInViewBody({required this.signInViewModel, super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  bool rememberMe = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewModel, SignInState>(
      bloc: widget.signInViewModel,
      listener: (context, state) {
        switch (state) {
          case SignInLoadingState():
            log('loading');
            EasyLoading.show();
          case SignInSuccessState():
            log('success');
            _saveToken(state);
            EasyLoading.dismiss();
            Navigator.pushReplacementNamed(context, PagesRoutes.layOutScreen);
          case SignInErrorState():
            log("${state.message}++++++++++++++");
            EasyLoading.dismiss();
            EasyLoading.showError(state.message);
          default:
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: 30,
          ),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: validateMode,
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: validateMode,
                    validator: (value) {
                      if (value == null || value.isEmpty == true) {
                        return S.of(context).emailRequired;
                      }
                      if (!value.isValidEmail) {
                        return S.of(context).emailInvalid;
                      }
                      return null;
                    },
                    onChanged: onChange,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: S.of(context).email,
                      hintText: S.of(context).enterYourPassword,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    autovalidateMode: validateMode,
                    obscureText: !isPasswordVisible,
                    obscuringCharacter: '*',
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty == true) {
                        return S.of(context).passwordRequired;
                      }
                      if (value.length < 8) {
                        return S.of(context).passwordTooShort;
                      }
                      if (!value.isValidPassword) {
                        return S.of(context).passwordInvalid;
                      }
                      return null;
                    },
                    onChanged: onChange,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: S.of(context).password,
                      hintText: S.of(context).enterYourPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RememberMeWidget(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            PagesRoutes.forgetPassword,
                          );
                        },
                        child: Text(
                          S.of(context).forgetPassword,
                          style: AppTextStyles.inter400_12.copyWith(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          validateMode == AutovalidateMode.disabled
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                    ),
                    onPressed: () {
                      if (validateMode == AutovalidateMode.always) {
                        null;
                      } else {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            validateMode = AutovalidateMode.disabled;
                          });
                          var data = SignInRequest(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          widget.signInViewModel.signIn(data);
                        } else {
                          setState(() {
                            validateMode = AutovalidateMode.always;
                          });
                        }
                      }
                    },
                    child: Text(
                      S.of(context).login,
                      style: AppTextStyles.inter500_16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      await SharedPreferenceServices.deleteData(
                        AppConstants.token,
                      );
                      await SharedPreferenceServices.deleteData(
                        AppConstants.rememberMe,
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        PagesRoutes.layOutScreen,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Text(
                      S.of(context).continueAsGuest,
                      style: AppTextStyles.inter500_16.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  NoHaveAccountWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onChange(value) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        validateMode = AutovalidateMode.disabled;
      });
    } else {
      setState(() {
        validateMode = AutovalidateMode.always;
      });
    }
  }

  void _saveToken(SignInSuccessState state) async {
    log('token saved');
    await SharedPreferenceServices.saveData(
      AppConstants.token,
      state.data.token,
    );
    await SharedPreferenceServices.saveData(
      AppConstants.rememberMe,
      rememberMe ? true : false,
    );
    log(SharedPreferenceServices.getData(AppConstants.token).toString());
    log(SharedPreferenceServices.getData(AppConstants.rememberMe).toString());
  }
}
