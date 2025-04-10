import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/result.dart';
import '../../domain/use_case/profile_screen_use_case.dart';


@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel(this._profileUseCase) : super(LoadingProfileState());

  final ProfileUseCase _profileUseCase;

  void doIntent(ProfileIntent occasionIntent) {
    switch (occasionIntent) {
      case ProfileClickedIntent():
        _getProfile();
        break;
    }
  }


  Future<void> _getProfile() async {
  }
}



sealed class ProfileIntent {}

class ProfileClickedIntent extends ProfileIntent {}

