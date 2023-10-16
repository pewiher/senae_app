import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class SenaeClient extends DioForNative implements Dio {
  // final GetTokenUseCase _getTokenUseCase;

  SenaeClient() {
    //final config = Config();
    final options = BaseOptions(
        baseUrl: 'http://10.212.134.160:8000/api/v1' //config.baseUrl!,
        // headers: {'x-api-key': config.jetzApiKey},
        );
    this.options = options;
    interceptors.add(InterceptorsWrapper(
      onRequest: onRequest,
    ));
  }

  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = await _getTokenUseCase.getToken();
    // options.headers.addAll({'Authorization': 'Bearer $token'});
    return handler.next(options);
  }
}
