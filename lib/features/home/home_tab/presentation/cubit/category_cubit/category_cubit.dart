import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/home_tab/domain/user_case/home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/category_entity.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());
  final HomeUseCase getCategoriesUseCase;

  Future<void> fetchCategories() async {
    if (isClosed) return;
    emit(CategoryLoading());

    final result = await getCategoriesUseCase.executeCategory();
    switch (result) {
      case Success():
        if (result.data != null) {
          if (isClosed) return;
          emit(CategoriesLoaded(result.data!));
        }

      case Error():
        if (isClosed) return;
        emit(CategoriesError(result.exception.toString()));
    }
  }
}
