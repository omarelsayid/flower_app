import 'package:dio/dio.dart';

import '../common/result.dart';
import '../error/failures.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } catch (ex) {
    if (ex is DioException) {
      return Error(ServerFailure.fromDioException(ex).toString());
    } else if (ex is ServerFailure) {
      return Error(ServerFailure(errorMessage: ex.errorMessage).toString());
    } else {
      return Error(ex.toString());
    }
  }
}
