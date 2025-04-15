import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/utils/constant_manager.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../cubit/upload_photo_cubit/upload_photo_view_model.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  EditProfileViewModel editProfileViewModel = getIt.get<EditProfileViewModel>();
  UploadPhotoViewModel uploadPhotoViewModel = getIt.get<UploadPhotoViewModel>();

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as UserEntity;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => editProfileViewModel),
        BlocProvider(create: (context) => uploadPhotoViewModel),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppConstants.editProfile,
            style: AppTextStyles.roboto500_18.copyWith(fontSize: 20),
          ),
          actions: [
            ImageIcon(AssetImage(IconAssets.notificationIcon), size: 24),
            SizedBox(width: resposiveHeight(16)),
          ],
        ),
        body: EditProfileViewBody(
          editProfileViewModel: editProfileViewModel,
          uploadPhotoViewModel: uploadPhotoViewModel,
          userData: userData,
        ),
      ),
    );
  }
}
