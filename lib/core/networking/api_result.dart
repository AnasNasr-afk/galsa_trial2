


import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
class ApiResult<T> with _$ApiResult<T> {

  const factory ApiResult.success(T data) = _Success<T> ;
  const factory ApiResult.failure(String message) = _Failure<T> ;
}