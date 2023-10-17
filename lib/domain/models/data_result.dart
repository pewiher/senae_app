import 'package:senae_app/domain/models/senae_exception.dart';

class DataResult<T> {
  ResultState state;
  T? data;
  SenaeException? exception;

  DataResult._({
    required this.state,
    this.data,
    this.exception,
  });

  factory DataResult.initial() => DataResult._(state: ResultState.initial);

  factory DataResult.loading() => DataResult._(state: ResultState.loading);

  factory DataResult.success(T data) => DataResult._(
        state: ResultState.success,
        data: data,
      );

  factory DataResult.error(T data) => DataResult._(
        state: ResultState.exception,
        data: data,
      );

  factory DataResult.exception(SenaeException exception) => DataResult._(
        state: ResultState.exception,
        exception: exception,
      );
}

enum ResultState { initial, loading, success, exception }
