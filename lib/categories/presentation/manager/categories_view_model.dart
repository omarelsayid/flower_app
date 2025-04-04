import 'dart:developer';
import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/categories/domain/entity/specific_category_response_entity.dart';
import 'package:flower_app/categories/domain/use_case/categories_use_case.dart';
import 'package:flower_app/categories/presentation/manager/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/result.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  CategoriesViewModel(this._categoriesUseCase)
    : super(CategoriesLoadingState());
  final CategoriesUseCase _categoriesUseCase;

  List<CategoriesEntity> categories = [];
  List<ProductsEntity> products = [];
  int currentIndex = 0;

  void doIntent(CategoriesIntent categoriesIntent) {
    switch (categoriesIntent) {
      case GetAllCategoriesIntent():
        _getAllCategories();
        break;
      case GetSpecificCategoryIntent():
        _getSpecificCategory(categoriesIntent.categoryId);
        break;
      case ChangeCategoriesIndexIntent():
        _changeCategoryIndex(categoriesIntent.index);
    }
  }

  Future<void> _getAllCategories() async {
    emit(CategoriesLoadingState());
    var result = await _categoriesUseCase.execute();
    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          categories = data.categories!;
          for (var i = 0; i < categories.length; i++) {
            log("categories ${categories[i].name}");
          }
          _getSpecificCategory(categories[currentIndex].id.toString());
          emit(CategoriesSuccessState(data.categories!));

        } else {
          emit(CategoriesErrorState(data.message!));

        }
        break;
      case Error():
        emit(CategoriesErrorState(result.exception!));
        break;
    }
  }

  void _changeCategoryIndex(int index) {
    emit(ChangeCategoriesIndexState());
    currentIndex = index;
    _getSpecificCategory(categories[currentIndex].id.toString());
    log(currentIndex.toString());
    emit(CategoriesSuccessState(categories));
  }

  Future<void> _getSpecificCategory(String categoryId) async {
    emit(SpecificCategoriesLoadingState());
    var result = await _categoriesUseCase.call(categoryId);
    log("message $result");
    switch (result) {
      case Success():
        var data = result.data;
        if ( data!.message == "success") {
          // products = data.products!;
          log("title ${data.products!.length.toString()}");
          emit(SpecificCategoriesSuccessState(data.products??[]));
        } else {
          emit(SpecificCategoriesErrorState(data.message!));
        }
        break;
      case Error():
        emit(SpecificCategoriesErrorState(result.exception!));
        break;
    }
  }
}

sealed class CategoriesIntent {}

class GetAllCategoriesIntent extends CategoriesIntent {}

class GetSpecificCategoryIntent extends CategoriesIntent {
  final String categoryId;

  GetSpecificCategoryIntent(this.categoryId);
}

class ChangeCategoriesIndexIntent extends CategoriesIntent {
  final int index;

  ChangeCategoriesIndexIntent(this.index);
}
