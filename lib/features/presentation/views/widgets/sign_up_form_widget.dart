import 'package:flower_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constans.dart';
import '../../../../core/utils/text_styles.dart';
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
                    // validator: AppValidate.validateEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your First Name';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Last Name';
                      }
                      return null;
                    },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }

                if (!value.isValidEmail) {
                  return 'invalid email format';
                }
                return null;
              },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (!value.isValidPassword) {
                        return 'invalid password format';
                      }

                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (!value.isValidPassword) {
                        return 'invalid password format';
                      }

                      return null;
                    },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }

                if (!value.isValidPhone) {
                  return 'invalid phone format';
                }

                return null;
              },
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
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: kVerticalHPadding),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to login
                },
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          decorationThickness: 2,
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
