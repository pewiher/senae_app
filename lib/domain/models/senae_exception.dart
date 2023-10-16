import 'package:dio/dio.dart';

class SenaeException implements Exception {
  SenaeException({required this.code, this.message});

  final String code;
  final String? message;

  factory SenaeException.fromException(
    dynamic e,
    StackTrace? s,
  ) {
    late SenaeException _instance;

    if (e is DioError) {
      _instance = SenaeException._fromDioError(e);
    } else if (e is SenaeException) {
      _instance = e;
    } else {
      _instance = SenaeException(code: 'unexpected_error');
    }

    return _instance;
  }

  factory SenaeException._fromDioError(DioError e) {
    final request = e.requestOptions;

    String code = '';
    switch (e.type) {
      case DioExceptionType.cancel:
        code = 'request_cancel';
        break;
      case DioExceptionType.connectionTimeout:
        code = 'request_connect_timeout';
        break;
      case DioExceptionType.unknown:
        code = 'request_unknow';
        break;
      case DioExceptionType.receiveTimeout:
        code = 'request_recive_timeout';
        break;
      case DioExceptionType.sendTimeout:
        code = 'request_send_timeout';
        break;
      case DioExceptionType.badResponse:
        final response = e.response ?? Response(requestOptions: request);

        if (response.data is Map) {
          code = response.data['codeApi'] ?? 'unknow_code';
        } else if (response.data is String) {
          code = response.data ?? 'unknow_code';
        } else {
          code = 'unknow_code';
        }
        break;
      default:
        break;
    }
    return SenaeException(code: code);
  }
}
