//
// import 'package:dio/dio.dart';
//
// import '../../features/domain/common/result.dart';
//
// Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
//   try {
//     var result = await apiCall.call();
//     return Success(result);
//   } catch (ex) {
//     if (ex is DioException) {
//       return Error(ServerFailure.fromDioError(ex).toString());
//     } else if (ex is ServerFailure) {
//       return Error(ServerFailure(ex.errorMessage).toString());
//     } else {
//       return Error(NetworkFailure(ex.toString()).toString());
//     }
//   }
// }
