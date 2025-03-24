import 'dart:developer';

import 'package:flower_app/features/presentation/manager/verify_email_cubit/verify_email_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../../domain/common/result.dart';
import '../../../domain/use_case/auth_use_case.dart';
@injectable
class VerifyEmailVewModel extends Cubit<VerifyEmailState> {
  VerifyEmailVewModel(this._auth) : super(LoadingVerifyEmailState());
  final AuthUseCase _auth;
  final code1 = TextEditingController();
  final code2 = TextEditingController();
  final code3 = TextEditingController();
  final code4 = TextEditingController();
  final code5 = TextEditingController();
  final code6 = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();
  final GlobalKey<FormState> formVerifyKey = GlobalKey<FormState>();
  void doIntent(VerifyEmailIntent verifyEmailIntent) {
    switch(verifyEmailIntent){
      case ContinueClickedIntent():
        if(formVerifyKey.currentState!.validate()){
          _verifyEmail(_collectVerifyCode());
        }
      case ResendClickedIntent():
        _resendCode(SharedPreferenceServices.getData(AppConstants.email.toString()).toString());
      case DisposeEmailIntent():
        _disposeTextField();
    }
  }
 void _disposeTextField(){
    code1.clear();
    code2.clear();
    code3.clear();
    code4.clear();
    code5.clear();
    code6.clear();

 }
  String _collectVerifyCode() {
    return "${code1.text}${code2.text}${code3.text}${code4.text}${code5.text}${code6.text}";
  }
  void onChanged(BuildContext context,String value, FocusNode nextFocusNode) {
    if (value.length == 1) {
      FocusScope.of(context).requestFocus(nextFocusNode);
    }
  }
  void _verifyEmail(String code) async {
    emit(LoadingVerifyEmailState());
    var result = await _auth.callVerifyEmail(code);
    log(("result => $result"));
    switch (result) {
      case Success():
        var data = result.data;
        log("data $data");
        if (data!.status == "Success") {
          emit(SuccessVerifyEmailState());
        } else {
          emit(ErrorVerifyEmailState("something went wrong"));
        }
      case Error():
        emit(ErrorVerifyEmailState(result.exception!));
    }
  }
  void _resendCode(String email)async{
    emit(LoadingResendEmailState());
    var result=await _auth.callForgetPassword(email);
    switch(result){
      case Success():
        var data = result.data;
        if(data!.message=="success"){
          emit(SuccessResendEmailState());
        }else{
          emit(ErrorResendEmailState(data.message));
        }
      case Error():
        emit(ErrorResendEmailState(result.exception!));
    }
  }
}
sealed class VerifyEmailIntent {}
class ContinueClickedIntent extends VerifyEmailIntent {}
class ResendClickedIntent extends VerifyEmailIntent {
}
class DisposeEmailIntent extends VerifyEmailIntent{}