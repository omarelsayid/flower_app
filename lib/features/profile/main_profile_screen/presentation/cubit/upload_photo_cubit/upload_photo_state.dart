sealed class UploadPhotoState {}

class UploadPhotoInitialState extends UploadPhotoState {}

class UploadPhotoLoadingState extends UploadPhotoState {}

class UploadPhotoSuccessState extends UploadPhotoState {}

class UploadPhotoErrorState extends UploadPhotoState {
  final String message;
  UploadPhotoErrorState(this.message);
}
