import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/addresses/domain/repository/get_place_details_repo.dart';
import 'package:flower_app/features/addresses/presentation/cubit/place_details_cubit/place_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaceDetailsCubit extends Cubit<PlaceDetailsStates> {
  final GetPlaceDetailsRepo getPlaceDetailsRepo;
  PlaceDetailsCubit(this.getPlaceDetailsRepo) : super(PlaceDetailsInitial());

  Future<void> getPlaceDetails(String placeId) async {
    emit(PlaceDetailsLoading());
    final Result<Map<String, dynamic>> result = await getPlaceDetailsRepo
        .getPlaceDetails(placeId);
    switch (result) {
      case Success():
        emit(PlaceDetailsSuccess(placeDetailsMap: result.data!));
        break;
      case Error():
        emit(PlaceDetailsError(message: result.exception.toString()));
        break;
    }
  }
}
