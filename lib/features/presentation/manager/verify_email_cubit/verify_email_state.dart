sealed class VerifyEmailState{

}
class LoadingVerifyEmailState extends VerifyEmailState{}
class SuccessVerifyEmailState extends VerifyEmailState{}
class ErrorVerifyEmailState extends VerifyEmailState{
  final String?errMessage;
  ErrorVerifyEmailState(this.errMessage);
}
class LoadingResendEmailState extends VerifyEmailState{}
class SuccessResendEmailState extends VerifyEmailState{}
class ErrorResendEmailState extends VerifyEmailState{
  final String? errMessage;
  ErrorResendEmailState(this.errMessage);
}