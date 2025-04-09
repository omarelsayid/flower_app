import 'package:bloc/bloc.dart';
import 'package:flower_app/core/common/result.dart';
import 'package:flower_app/features/home/home_tab/domain/user_case/home_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/category_entity.dart';

part 'category_state.dart';

@injectable

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());
  final HomeUseCase getCategoriesUseCase;


  Future<void> fetchCategories()async{
    emit(CategoryLoading());

    final result = await getCategoriesUseCase.executeCategory();
    switch(result)
        {
      case Success():
        if(result.data != null)
          {
            emit(CategoriesLoaded(result.data!));
          }

      case Error():
        emit(CategoriesError(result.exception.toString()));
    }
  }

}
