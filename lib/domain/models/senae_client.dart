import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class SenaeClient extends DioForNative implements Dio {
  // final GetTokenUseCase _getTokenUseCase;

  SenaeClient() {
    //NetworkHelper(){
    //final config = Config();
    final options = BaseOptions(
      baseUrl:
          'https://3cdb-181-198-116-210.ngrok.io/api/v1', //config.baseUrl!,
      validateStatus: (int? status) {
        return status! > 0; //this will always redirect to onResponse method
      },
      headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
      },
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
