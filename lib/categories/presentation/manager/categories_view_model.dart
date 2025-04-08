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
  List<ProductsEntity> allProducts = [];  // store all products
  List<ProductsEntity> products = [];
  int currentIndex = 0;
  bool isSearching = false;

  void doIntent(CategoriesIntent intent) {
    switch (intent) {
      case GetAllCategoriesIntent():
        _getAllCategories();
        break;
      case GetSpecificCategoryIntent():
        _getSpecificCategory(intent.categoryId);
        break;
      case ChangeCategoriesIndexIntent():
        _changeCategoryIndex(intent.index);
        break;
      case SearchIntent():
        _search(query: intent.query);
        break;
    }
  }

  Future<void> _search({required String query}) async {
    try {
      emit(LoadingSearchState());
      isSearching = true;
      var result = allProducts.where((product) =>
          product.title!.toUpperCase().contains(query.toUpperCase())
      ).toList();

      products = result;
      log("Search Results: ${products.length}");
      emit(SuccessfulSearchState(products));
    } catch (e) {
      emit(FailedSearchState(e.toString()));
    }
  }

  Future<void> _getAllCategories() async {
    emit(CategoriesLoadingState());
    isSearching = false;
    var result = await _categoriesUseCase.execute();

    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          categories = data.categories!;
          emit(CategoriesSuccessState(categories));
          _getSpecificCategory(categories[currentIndex].id.toString());
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
    currentIndex = index;
    emit(ChangeCategoriesIndexState());
    _getSpecificCategory(categories[currentIndex].id.toString());
  }

  Future<void> _getSpecificCategory(String categoryId) async {
    emit(SpecificCategoriesLoadingState());
    var result = await _categoriesUseCase.call(categoryId);

    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          allProducts = data.products ?? [];
          log("Products Count: ${allProducts.length}");
          emit(SpecificCategoriesSuccessState(data.products ?? []));
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
class SearchIntent extends CategoriesIntent{
  final String query;
  SearchIntent(this.query);
}