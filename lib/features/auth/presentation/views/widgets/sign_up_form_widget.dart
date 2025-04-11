import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routes_generator/pages_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_validate.dart';
import '../../cubit/signup_view_model.dart';

class SignUpFormWidget extends StatelessWidget {
  final SignUpViewModel vmSignUp;
  const SignUpFormWidget({super.key, required this.vmSignUp});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: vmSignUp.formSignUpKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: vmSignUp.firstNameController,
                    decoration: InputDecoration(
                      hintText: S.of(context).firstName,
                      labelText: S.of(context).enterFirstName,
                    ),
                    validator: AppValidate.validateFullName,
                  ),
                ),
                SizedBox(width: kHorizontalPadding),
                Expanded(
                  child: TextFormField(
                    controller: vmSignUp.lastNameController,
                    decoration: InputDecoration(
                      hintText: S.of(context).lastName,
                      labelText: S.of(context).enterLastName,
                    ),
                    validator: AppValidate.validateFullName,
                  ),
                ),
              ],
            ),
            SizedBox(height: kVerticalPadding),
            TextFormField(
              controller: vmSignUp.emailController,
              decoration: InputDecoration(
                hintText: S.of(context).enterYourEmail,
                labelText: S.of(context).email,
              ),
              validator: AppValidate.validateEmail,
            ),
            SizedBox(height: kVerticalPadding),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: vmSignUp.passwordController,
                    decoration: InputDecoration(
                      hintText: S.of(context).password,
                      labelText: S.of(context).enterYourPassword,
                    ),
                    obscureText: true,
                    validator: AppValidate.validatePassword,
                  ),
                ),
                SizedBox(width: kHorizontalPadding),
                Expanded(
                  child: TextFormField(
                    controller: vmSignUp.rePasswordController,
                    decoration: InputDecoration(
                      hintText: S.of(context).password,
                      labelText: S.of(context).confirmPassword,
                    ),
                    obscureText: true,
                    validator: AppValidate.validatePassword,
                  ),
                ),
              ],
            ),
            SizedBox(height: kVerticalPadding),
            TextFormField(
              controller: vmSignUp.phoneController,
              decoration: InputDecoration(
                hintText: S.of(context).enterPhoneNumber,
                labelText: S.of(context).phoneNumber,
              ),
              keyboardType: TextInputType.phone,
              validator: AppValidate.validateMobile,
            ),
            Row(
              children: [
                Text(S.of(context).gender, style: AppTextStyles.inter500_18),
                SizedBox(width: kHorizontalPadding),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: vmSignUp.selectedGender,
                  onChanged: (val) => vmSignUp.updateGender(val!),
                  activeColor: AppColors.primaryColor,
                ),
                Text(S.of(context).male, style: AppTextStyles.inter400_14),
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: vmSignUp.selectedGender,
                  onChanged: (val) => vmSignUp.updateGender(val!),
                  activeColor: AppColors.primaryColor,
                ),
                Text(S.of(context).female, style: AppTextStyles.inter400_14),
              ],
            ),
            if (!vmSignUp.isGenderSelected)
              Text(
                "Please select a gender",
                style: TextStyle(color: AppColors.errorColor),
              ),
            Row(
              children: [
                Text(
                  S.of(context).agreeToTerms,
                  style: AppTextStyles.inter400_12,
                ),
                Text(
                  S.of(context).termsAndConditions,
                  style: AppTextStyles.inter400_12.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: kVerticalPadding),
            SizedBox(height: kVerticalPadding),
            ElevatedButton(
              onPressed: () => vmSignUp.doIntent(SignUpClickedIntent()),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                S.of(context).signUp,
                style: AppTextStyles.inter500_16.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: kVerticalHPadding),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PagesRoutes.signInScreen,
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: S.of(context).haveAccount,
                    style: AppTextStyles.inter500_16,
                    children: [
                      TextSpan(
                        text: S.of(context).loginLink,
                        style: AppTextStyles.inter500_16.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
