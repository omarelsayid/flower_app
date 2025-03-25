import 'package:flutter/material.dart';
import '../../../../core/routes_generator/pages_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constans.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_validate.dart';
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
                      hintText: 'Enter first name',
                      labelText: 'First name',
                    ),
                    validator: AppValidate.validateFullName,
                  ),
                ),
                SizedBox(width: kHorizontalPadding),
                Expanded(
                  child: TextFormField(
                    controller: vmSignUp.lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter last name',
                      labelText: 'Last name',
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
                hintText: 'Enter your email',
                labelText: 'Email',
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
                      hintText: 'Password',
                      labelText: 'Enter password',
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
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
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
                hintText: 'Enter phone number',
                labelText: 'Phone number',
              ),
              keyboardType: TextInputType.phone,
              validator: AppValidate.validateMobile,
            ),
            Row(
              children: [
                Text("Gender", style: AppTextStyles.inter500_18),
                SizedBox(width: kHorizontalPadding),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: vmSignUp.selectedGender,
                  onChanged: (val) => vmSignUp.updateGender(val!),
                  activeColor: AppColors.primaryColor,
                ),
                Text("Female", style: AppTextStyles.inter400_14),
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: vmSignUp.selectedGender,
                  onChanged: (val) => vmSignUp.updateGender(val!),
                  activeColor: AppColors.primaryColor,
                ),
                Text("Male", style: AppTextStyles.inter400_14),
              ],
            ),
            if (!vmSignUp.isGenderSelected)
              Text(
                "Please select a gender",
                style: TextStyle(color: AppColors.errorColor,),
              ),
            Row(
              children: [
                Text(
                  "Creating an account, you agree to our ",
                  style: AppTextStyles.inter400_12,
                ),
                Text(
                  "Terms&Conditions",
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
                "Sign up",
                style: AppTextStyles.inter500_16.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: kVerticalHPadding),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, PagesRoutes.signInScreen);},
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: AppTextStyles.inter500_16,
                    children: [
                      TextSpan(
                        text: "Login",
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