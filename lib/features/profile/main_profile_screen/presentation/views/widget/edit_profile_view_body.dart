import 'dart:developer';

import 'package:flower_app/core/services/shared_preference_services.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/constans.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/core/utils/extensions.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/widgets/custom_validate.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/model/edit_profile_request.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_state.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/profile_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

enum Gender { male, female }

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
    required this.editProfileViewModel,
    required this.userData,
  });
  final EditProfileViewModel editProfileViewModel;
  final UserEntity userData;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late final TextEditingController _firstNameController = TextEditingController(
    text: widget.userData.firstName,
  );
  late final TextEditingController _lastNameController = TextEditingController(
    text: widget.userData.lastName,
  );
  late final TextEditingController _emailController = TextEditingController(
    text: widget.userData.email,
  );
  late final TextEditingController _phoneController = TextEditingController(
    text: widget.userData.phone,
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '123456',
  );
  AutovalidateMode validateMode = AutovalidateMode.always;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGender;
  @override
  void initState() {
    selectedGender = widget.userData.gender!;
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: validateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              ProfileAppBarWidget(),
              SizedBox(height: 24),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: validateMode,
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return "empty first name are not allowed";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        checkValidateForTextField();
                      },
                    ),
                  ),
                  SizedBox(width: 17),
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: validateMode,
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return "empty last name are not allowed";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        checkValidateForTextField();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              TextFormField(
                autovalidateMode: validateMode,
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return "emails can not be empty";
                  }
                  if (!value.isValidEmail) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                onChanged: (value) {
                  checkValidateForTextField();
                },
              ),

              SizedBox(height: 24),
              TextFormField(
                autovalidateMode: validateMode,
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: AppValidate.validateMobile,
                onChanged: (value) {
                  checkValidateForTextField();
                },
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: _passwordController,
                obscuringCharacter: '★',
                readOnly: true,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                    onPressed: () {
                      //navigate to change password screen
                    },
                    child: Text(
                      'change',
                      style: AppTextStyles.inter400_12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text("Gender", style: AppTextStyles.inter500_18),
                  SizedBox(width: kHorizontalPadding),
                  Radio<String>(
                    value: 'female',
                    activeColor: AppColors.primaryColor,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  Text("Female", style: AppTextStyles.inter400_14),
                  Radio<String>(
                    value: 'male',
                    activeColor: AppColors.primaryColor,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  Text("Male", style: AppTextStyles.inter400_14),
                ],
              ),
              SizedBox(height: 8),
              BlocConsumer<EditProfileViewModel, EditProfileState>(
                bloc: widget.editProfileViewModel,
                listener: (context, state) {
                  switch (state) {
                    case EditProfileLoadingState():
                      log('loading');
                      EasyLoading.show();
                    case EditProfileSuccessState():
                      log('success');
                      EasyLoading.dismiss();
                      EasyLoading.showSuccess("Profile Edit successfully");
                    case EditProfileErrorState():
                      log('error');
                      EasyLoading.dismiss();
                      EasyLoading.showError(state.message);
                    default:
                  }
                },
                builder: (context, state) {
                  if (state is EditProfileLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else {
                    return ElevatedButton(
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
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              validateMode = AutovalidateMode.disabled;
                            });
                            // var data = EditProfileRequest(
                            //   firstName: _firstNameController.text,
                            //   lastName: _lastNameController.text,
                            //   email: _emailController.text,
                            //   gender: selectedGender!,
                            //   phone: _phoneController.text,
                            // );
                            widget.editProfileViewModel.editProfile({
                              'firstName': _firstNameController.text,
                              'lastName': _lastNameController.text,
                              'email': _emailController.text,
                              'phone': _phoneController.text,
                            });

                            setState(() {
                              validateMode = AutovalidateMode.always;
                            });
                          } else {
                            setState(() {
                              validateMode = AutovalidateMode.always;
                            });
                          }
                        }
                      },
                      child: Text(
                        'update',
                        style: AppTextStyles.roboto500_16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkValidateForTextField() {
    if (formKey.currentState!.validate()) {
      setState(() {
        validateMode = AutovalidateMode.disabled;
      });
    } else {
      setState(() {
        validateMode = AutovalidateMode.always;
      });
    }
  }
}
