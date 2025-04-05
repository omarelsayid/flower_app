part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState{}

class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoryState {
  final String message;
  CategoriesError(this.message);
}


