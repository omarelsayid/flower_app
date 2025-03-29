import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';

sealed class CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  List<CategoriesEntity> categoriesList;

  CategoriesSuccessState(this.categoriesList);
}

class CategoriesErrorState extends CategoriesState {
  final String errMessage;

  CategoriesErrorState(this.errMessage);
}
