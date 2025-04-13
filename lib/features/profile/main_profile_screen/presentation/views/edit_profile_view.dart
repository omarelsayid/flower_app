import 'package:flower_app/di/injectable_initializer.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/entity/profile_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  EditProfileViewModel editProfileViewModel = getIt.get<EditProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as UserEntity;
    return BlocProvider(
      create: (context) => editProfileViewModel,
      child: Scaffold(
        body: EditProfileViewBody(
          editProfileViewModel: editProfileViewModel,
          userData: userData,
        ),
      ),
    );
  }
}
