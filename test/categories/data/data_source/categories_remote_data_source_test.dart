// import 'package:flower_app/features/home/categories/data/data_source/categories_remote_data_source.dart';
// import 'package:flower_app/features/home/categories/data/model/categories_response_model.dart';
// import 'package:flower_app/features/home/categories/data/model/specific_categories_response_model.dart';
// import 'package:flower_app/features/home/categories/domain/entity/categories_response_entity.dart';
// import 'package:flower_app/features/home/categories/domain/entity/specific_category_response_entity.dart';
// import 'package:flower_app/core/api/api_client.dart';
// import 'package:flower_app/core/common/result.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'categories_remote_data_source_test.mocks.dart';
//
// @GenerateMocks([ApiClient])
// void main() {
//   group("CategoriesRemoteDataSource Test", () {
//     late CategoriesRemoteDataSource dataSource;
//     late ApiClient apiClient;
//     setUp(() {
//       apiClient = MockApiClient();
//       dataSource = CategoriesRemoteDataSourceImpl(apiClient);
//     });
//     test("when call getAllCategories from CategoriesRemoteDataSource "
//         "it should call getAllCategories from ApiClient", () async {
//       // arrange
//       var result = CategoriesResponseModel(
//         categories: [
//           CategoriesModel(id: "1", name: "eslam", image: "image1"),
//           CategoriesModel(id: "2", name: "eslam", image: "image1"),
//           CategoriesModel(id: "3", name: "eslam", image: "image1"),
//         ],
//         message: "success",
//       );
//       when(apiClient.getAllCategories()).thenAnswer((_) async => result);
//       // act
//       var actual =
//       await dataSource.getAllCategories()
//       as Success<CategoriesResponseEntity>;
//       // assert
//       verify(apiClient.getAllCategories()).called(1);
//       expect(
//         actual.data!.categories!.length,
//         equals(result.categories!.length),
//       );
//     });
//     test(
//         "when call getSpecificCategory from CategoriesRemoteDataSource "
//             "it should call getSpecificCategory from ApiClient",
//         () async{
//           var result= SpecificCategoriesResponseModel(products: [ProductsModel(id: "1", title: "eslam", imgCover: "image1"),
//           ProductsModel(id: "2", title: "eslam", imgCover: "image2"),
//           ProductsModel(id: "3", title: "eslam", imgCover: "image3"),
//           ], message: "success");
//           when(apiClient.getSpecificCategory("")).thenAnswer((_) async =>result);
//           var actual=await dataSource.getSpecificCategory("") as Success<SpecificCategoriesResponseEntity>;
//           verify(apiClient.getSpecificCategory("")).called(1);
//           expect(actual.data!.products!.length, equals(result.products!.length));
//         },);
//   });
// }
