import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/routes_generator/pages_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/widgets/custom_diaolg.dart';
import '../../../../../core/widgets/custom_validate.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../../cubit/forget_password_cubit/forget_password_state.dart';
import '../../cubit/forget_password_cubit/forget_password_view_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordViewModel viewModel = getIt.get<ForgetPasswordViewModel>();
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(S.of(context).password)),
        body: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
          bloc: viewModel..doIntent,
          listener: (context, state) {
            if (state is LoadingForgetPasswordState) {
              EasyLoading.show();
            } else if (state is ErrorForgetPasswordState) {
              EasyLoading.dismiss();
              DialogUtils.showMessage(
                context: context,
                message: state.errorMessage.toString(),
                title: "Error",
                postActionName: "Ok",
              );
            } else if (state is SuccessForgetPasswordState) {
              EasyLoading.dismiss();
              Navigator.pushNamed(
                context,
                PagesRoutes.emailVerification,
                arguments: viewModel.email.text,
              );
            }
          },
          child: Form(
            key: viewModel.formForgetKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: kVerticalPadding),

                  Text(
                    S.of(context).forgetPassword,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: kVerticalPadding),
                  Text(
                    S.of(context).forgetPasswordDescription,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: kVerticalPadding),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: S.of(context).email,
                      hintText: S.of(context).enterYourEmail,
                    ),

                    controller: viewModel.email,
                    validator: AppValidate.validateEmail,
                  ),
                  SizedBox(height: kVerticalPadding),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.doIntent(ContinueClickedIntent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      S.of(context).confirm,

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
