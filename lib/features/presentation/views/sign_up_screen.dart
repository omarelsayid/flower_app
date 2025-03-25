// import 'package:flower_app/core/utils/extensions.dart';
// import 'package:flower_app/core/utils/text_styles.dart';
// import 'package:flower_app/core/widgets/custom_validate.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flower_app/features/presentation/cubit/signup_state.dart';
//
// import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/constans.dart';
// import '../../../di/injectable_initializer.dart';
// import '../cubit/signup_view_model.dart';
//
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<SignUpViewModel>(),
//       child: BlocBuilder<SignUpViewModel, SignUpState>(
//         builder: (context, state) {
//           final cubit = context.read<SignUpViewModel>();
//           return Scaffold(
//             appBar: AppBar(title: const Text("Sign up")),
//             body: Form(
//               key: cubit.formSignUpKey,
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: kVerticalPadding),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: cubit.firstNameController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter first name',
//                               labelText: 'First name',
//                             ),
//                             // validator: AppValidate.validateEmail,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your First Name';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         SizedBox(width: kHorizontalPadding),
//                         Expanded(
//                           child: TextFormField(
//                             controller: cubit.lastNameController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter last name',
//                               labelText: 'Last name',
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your Last Name';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: kVerticalPadding),
//                     TextFormField(
//                       controller: cubit.emailController,
//                       decoration: InputDecoration(
//                         hintText: 'Enter your email',
//                         labelText: 'Email',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//
//                         if (!value.isValidEmail) {
//                           return 'invalid email format';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: kVerticalPadding),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: cubit.passwordController,
//                             decoration: InputDecoration(
//                               hintText: 'Password',
//                               labelText: 'Enter password',
//                             ),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//
//                               if (!value.isValidPassword) {
//                                 return 'invalid password format';
//                               }
//
//                               return null;
//                             },
//                           ),
//                         ),
//                         SizedBox(width: kHorizontalPadding),
//                         Expanded(
//                           child: TextFormField(
//                             controller: cubit.rePasswordController,
//                             decoration: InputDecoration(
//                               hintText: 'Confirm Password',
//                               labelText: 'Confirm Password',
//                             ),
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//
//                               if (!value.isValidPassword) {
//                                 return 'invalid password format';
//                               }
//
//                               return null;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: kVerticalPadding),
//                     TextFormField(
//                       controller: cubit.phoneController,
//                       decoration: InputDecoration(
//                         hintText: 'Enter phone number',
//                         labelText: 'Phone number',
//                       ),
//                       keyboardType: TextInputType.phone,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your phone number';
//                         }
//
//                         if (!value.isValidPhone) {
//                           return 'invalid phone format';
//                         }
//
//                         return null;
//                       },
//                     ),
//                     Row(
//                       children: [
//                         Text("Gender", style: AppTextStyles.inter500_18),
//                         SizedBox(width: kHorizontalPadding),
//                         Radio<Gender>(
//                           value: Gender.female,
//                           groupValue: cubit.selectedGender,
//                           onChanged: (val) => cubit.updateGender(val!),
//                           activeColor: primaryColor,
//                         ),
//                         Text("Female", style: AppTextStyles.inter400_14),
//                         Radio<Gender>(
//                           value: Gender.male,
//                           groupValue: cubit.selectedGender,
//                           onChanged: (val) => cubit.updateGender(val!),
//                           activeColor: primaryColor,
//                         ),
//                         Text("Male", style: AppTextStyles.inter400_14),
//                       ],
//                     ),
//
//                     Row(
//                       children: [
//                         Text(
//                           "Creating an account, you agree to our ",
//                           style: AppTextStyles.inter400_12,
//                         ),
//
//                         Text(
//                           "Terms&Conditions",
//                           style: AppTextStyles.inter400_12.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: kVerticalPadding),
//                     SizedBox(height: kVerticalPadding),
//                     ElevatedButton(
//                       onPressed: () => cubit.doIntent(SignUpClickedIntent()),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: primaryColor,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         minimumSize: const Size.fromHeight(50),
//                       ),
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(height: kVerticalHPadding),
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Navigate to login
//                         },
//                         child: Text.rich(
//                           TextSpan(
//                             text: "Already have an account? ",
//                             children: [
//                               TextSpan(
//                                 text: "Login",
//                                 style: TextStyle(
//                                   color: primaryColor,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: TextDecoration.underline,
//                                   decorationColor: primaryColor,
//                                   decorationThickness: 2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flower_app/features/presentation/views/widgets/sign_up_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flower_app/features/presentation/cubit/signup_state.dart';
import '../cubit/signup_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpViewModel>(),
      child: BlocBuilder<SignUpViewModel, SignUpState>(
        builder: (context, state) {
          final cubit = context.read<SignUpViewModel>();
          return Scaffold(
            appBar: AppBar(title: const Text("Sign up")),
            body: SignUpFormWidget(vmSignUp: cubit),
          );
        },
      ),
    );
  }
}


