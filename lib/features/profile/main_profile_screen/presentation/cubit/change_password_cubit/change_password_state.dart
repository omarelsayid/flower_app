sealed class ChangePasswordState{

}
class ChangePasswordLoadingState extends ChangePasswordState{}
class ChangePasswordSuccessState extends ChangePasswordState{}
class ChangePasswordErrorState extends ChangePasswordState{
  final String errorMessage;
  ChangePasswordErrorState(this.errorMessage);
}
