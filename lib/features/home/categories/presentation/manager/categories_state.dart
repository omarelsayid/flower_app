import 'package:flower_app/features/home/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/features/home/categories/domain/entity/specific_category_response_entity.dart';

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



class SpecificCategoriesLoadingState extends CategoriesState {}
class SpecificCategoriesErrorState extends CategoriesState {
  final String errMessage;

  SpecificCategoriesErrorState(this.errMessage);
}
class SpecificCategoriesSuccessState extends CategoriesState {
  List<ProductsEntity> products;

  SpecificCategoriesSuccessState(this.products);
}
class ChangeCategoriesIndexState extends CategoriesState{}




class LoadingSearchState extends CategoriesState{

}
class FailedSearchState extends CategoriesState{
  String errMessage;
  FailedSearchState(this.errMessage);
}
class SuccessfulSearchState extends CategoriesState{
  List<ProductsEntity> products;
  SuccessfulSearchState(this.products);
}






class LoadingFilterState extends CategoriesState{}
class FailedFilterState extends CategoriesState{
  String errMessage;
  FailedFilterState(this.errMessage);
}
class SuccessfulFilterState extends CategoriesState{
  List<ProductsEntity> products;
  SuccessfulFilterState(this.products);
}
class FilterCategoriesState extends CategoriesState{}

