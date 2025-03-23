import 'dart:developer';

import 'package:flower_app/features/domain/common/result.dart';
import 'package:flower_app/features/domain/entity/sign_in_request.dart';
import 'package:flower_app/features/domain/use_case/sign_in%20_use_case.dart';
import 'package:flower_app/features/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  SignInViewModel(this._signInUseCase) : super(SignInInitialState());

  void signIn(SignInRequest data) async {
    emit(SignInLoadingState());
    log("loading state");
    var result = await _signInUseCase.execute(data);
    switch (result) {
      case Success():
        emit(SignInSuccessState(result.data!));
        log("success state");

      case Error():
        emit(SignInErrorState(result.exception!));
        log("error state");
    }
  }
}
