import 'dart:io';

import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/upload_photo_use_case.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/upload_photo_cubit/upload_photo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoViewModel extends Cubit<UploadPhotoState> {
  final UploadPhotoUseCase _uploadPhotoUseCase;
  UploadPhotoViewModel(this._uploadPhotoUseCase)
    : super(UploadPhotoInitialState());
  void uploadPhoto(File photo) async {
    emit(UploadPhotoLoadingState());
    final result = await _uploadPhotoUseCase.execute(photo);
    switch (result) {
      case Success():
        emit(UploadPhotoSuccessState());
      case Error():
        emit(UploadPhotoErrorState(result.exception!));
    }
  }
}
