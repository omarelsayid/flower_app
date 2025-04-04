import 'package:flower_app/categories/data/data_source/categories_remote_data_source.dart';
import 'package:flower_app/categories/data/repository_impl/categories_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
@GenerateMocks([CategoriesRemoteDataSource])
void main() {
  group("CategoriesRepositoryImpl Test", () {
    late CategoriesRepositoryImpl repo;
    late CategoriesRemoteDataSource dataSource;
    setUp(() {

    },);
    test(
      "when call getAllCategories from CategoriesRepositoryImpl "
      "it should call getAllCategories from CategoriesRemoteDataSource",
      () {},
    );
  });
}
