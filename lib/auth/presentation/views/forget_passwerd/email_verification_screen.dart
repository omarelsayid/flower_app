import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/routes_generator/pages_routes.dart';
import '../../../../core/utils/constans.dart';
import '../../../../core/widgets/custom_diaolg.dart';
import '../../../../di/injectable_initializer.dart';
import '../../cubit/verify_email_cubit/verify_email_state.dart';
import '../../cubit/verify_email_cubit/verify_email_vew_model.dart';
import '../widgets/custom_verify_text_field.dart';
import '../widgets/resend_otp_button.dart';

class EmailVerificationsScreen extends StatelessWidget {
   EmailVerificationsScreen({super.key,});
  late String? email;

  @override
  Widget build(BuildContext context) {
    VerifyEmailVewModel vewModel = getIt.get<VerifyEmailVewModel>();
    email = ModalRoute.of(context)!.settings.arguments.toString();
    debugPrint(email);
    return BlocProvider(
      create: (context) => vewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("Password")),
        body: BlocListener<VerifyEmailVewModel, VerifyEmailState>(
          listener: (context, state) {
            if (state is LoadingVerifyEmailState) {
              EasyLoading.show();
            }
            if (state is SuccessVerifyEmailState) {
              EasyLoading.dismiss();
              vewModel.doIntent(DisposeEmailIntent());
              Navigator.pushNamed(context, PagesRoutes.resetPassword, arguments: email);
            }
            if (state is ErrorVerifyEmailState) {
              EasyLoading.dismiss();
              DialogUtils.showMessage(
                title: "Error",
                context: context,
                message: state.errMessage.toString(),
                postActionName: "Ok",
              );
            }
            if (state is LoadingResendEmailState) {
              EasyLoading.show();
            }
            if (state is SuccessResendEmailState) {
              EasyLoading.dismiss();
              vewModel.doIntent(DisposeEmailIntent());
            }
            if (state is ErrorResendEmailState) {
              EasyLoading.dismiss();
              DialogUtils.showMessage(
                title: "Error",
                context: context,
                message: state.errMessage.toString(),
                postActionName: "Ok",
                postAction: () {
                  Navigator.pop(context);
                  vewModel.doIntent(ResendClickedIntent());
                },
              );
            }
          },
          child: Form(
            key: vewModel.formVerifyKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                children: [
                  SizedBox(height: kHorizontalPadding),
                  Text(
                    "Email verification",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: kVerticalPadding),

                  Text(
                    "Please enter your code that send to your\n email address",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: kVerticalPadding),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomVerifyTextField(
                        controller: vewModel.code1,
                        focusNode: vewModel.focusNode1,
                        onChanged:
                            (value) => vewModel.onChanged(
                              context,
                              value,
                              vewModel.focusNode2,
                              vewModel.focusNode1,
                            ),
                      ),
                      CustomVerifyTextField(
                        controller: vewModel.code2,
                        focusNode: vewModel.focusNode2,
                        onChanged:
                            (value) => vewModel.onChanged(
                              context,
                              value,
                              vewModel.focusNode3,
                              vewModel.focusNode1,
                            ),
                      ),
                      CustomVerifyTextField(
                        controller: vewModel.code3,
                        focusNode: vewModel.focusNode3,
                        onChanged:
                            (value) => vewModel.onChanged(
                              context,
                              value,
                              vewModel.focusNode4,
                              vewModel.focusNode2,
                            ),
                      ),
                      CustomVerifyTextField(
                        controller: vewModel.code4,
                        focusNode: vewModel.focusNode4,
                        onChanged:
                            (value) => vewModel.onChanged(
                              context,
                              value,
                              vewModel.focusNode5,
                              vewModel.focusNode3,
                            ),
                      ),
                      CustomVerifyTextField(
                        controller: vewModel.code5,
                        focusNode: vewModel.focusNode5,
                        onChanged:
                            (value) => vewModel.onChanged(
                              context,
                              value,
                              vewModel.focusNode6,
                              vewModel.focusNode4,
                            ),
                      ),
                      CustomVerifyTextField(
                        controller: vewModel.code6,
                        focusNode: vewModel.focusNode6,
                      ),
                    ],
                  ),
                  SizedBox(height: kVerticalPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Didn't receive code?"),
                      ResendOTPButton(
                        onResend: () {
                          vewModel.doIntent(ResendClickedIntent());
                        },
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     vewModel.doIntent(ResendClickedIntent());
                      //   },
                      //   child: Text("Resend",
                      //       ),
                      // ),
                    ],
                  ),
                  SizedBox(height: kVerticalPadding),
                  ElevatedButton(
                    onPressed: () {
                      vewModel.doIntent(ContinueClickedIntent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      "Confirm",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
