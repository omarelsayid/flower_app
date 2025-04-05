import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'occasion_state.dart';

class OccasionCubit extends Cubit<OccasionState> {
  OccasionCubit() : super(OccasionInitial());
}
