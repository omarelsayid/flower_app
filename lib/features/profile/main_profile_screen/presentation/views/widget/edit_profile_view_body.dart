import 'dart:developer';
import 'dart:io';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/features/profile/main_profile_screen/data/data_source/profile_remote_data_source.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/constans.dart';
import 'package:flower_app/core/utils/extensions.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/widgets/custom_validate.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_state.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/upload_photo_cubit/upload_photo_state.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/upload_photo_cubit/upload_photo_view_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubit/profile_view_model.dart';

enum Gender { male, female }

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
    required this.editProfileViewModel,
    required this.uploadPhotoViewModel,
    required this.userData,
  });
  final EditProfileViewModel editProfileViewModel;
  final UploadPhotoViewModel uploadPhotoViewModel;
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
  File? imageFile;
  ProfileRemoteDataSource profileRemoteDataSourceImpl =
      getIt<ProfileRemoteDataSource>();
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
              SizedBox(height: resposiveHeight(24)),
              BlocListener<UploadPhotoViewModel, UploadPhotoState>(
                bloc: widget.uploadPhotoViewModel,
                listener: (context, state) {
                  switch (state) {
                    case UploadPhotoLoadingState():
                      log('loading');
                      EasyLoading.show();
                    case UploadPhotoSuccessState():
                      log('success');
                      EasyLoading.dismiss();
                      EasyLoading.showSuccess("Upload photo successfully");
                    case UploadPhotoErrorState():
                      log('error');
                      EasyLoading.dismiss();
                      EasyLoading.showError(state.message);
                    default:
                  }
                },
                child: PickImageWidget(
                  isImageUploaded: widget.userData.photo != null ? true : false,
                  imagePath: widget.userData.photo,
                  imageFile: imageFile,
                  onPressed: () async {
                    imageFile = await pickImage();
                    setState(() {});
                    if (imageFile != null) {
                      widget.uploadPhotoViewModel.uploadPhoto(imageFile!);
                    }
                  },
                ),
              ),

              SizedBox(height: resposiveHeight(24)),
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
                  SizedBox(width: resposiveWidth(16)),
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
              SizedBox(height: resposiveHeight(24)),
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
              SizedBox(height: resposiveHeight(24)),
              TextFormField(
                autovalidateMode: validateMode,
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: AppValidate.validateMobile,
                onChanged: (value) {
                  checkValidateForTextField();
                },
              ),
              SizedBox(height: resposiveHeight(24)),
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
              SizedBox(height: resposiveHeight(24)),
              Row(
                children: [
                  Text("Gender", style: AppTextStyles.inter500_18),
                  SizedBox(width: kHorizontalPadding),
                  Radio<String>(
                    value: 'female',
                    activeColor: AppColors.primaryColor,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      // setState(() {
                      //   selectedGender = value;
                      // });
                    },
                  ),
                  Text("Female", style: AppTextStyles.inter400_14),
                  Radio<String>(
                    value: 'male',
                    activeColor: AppColors.primaryColor,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      // setState(() {
                      //   selectedGender = value;
                      // });
                    },
                  ),
                  Text("Male", style: AppTextStyles.inter400_14),
                ],
              ),
              SizedBox(height: resposiveHeight(32)),
              BlocConsumer<EditProfileViewModel, EditProfileState>(
                bloc: widget.editProfileViewModel,
                listener: (context, state) async{
                  switch (state) {
                    case EditProfileLoadingState():
                      log('loading');
                    case EditProfileSuccessState():
                      log('success');
                      EasyLoading.showSuccess("Profile Edit successfully");
                      Navigator.pop(context);

                    case EditProfileErrorState():
                      log('error');
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

  static Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final File imageFile = File(image.path);
      log('pick');
      return imageFile;
    } else {
      return null;
    }
  }
}
