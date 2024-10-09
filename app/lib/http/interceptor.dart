import 'package:dio/dio.dart';

import 'exception.dart';

// 自定义拦截器
class HttpInterceptor extends Interceptor {
  // 请求拦截
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    super.onRequest(options, handler);
  }

  // 响应拦截
  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // do something...
    super.onResponse(response, handler);
  }

  // 异常拦截
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // 覆盖异常为自定义的异常类
    HttpException httpException = HttpException.create(err);
    
    // 使用 handler.reject 来抛出自定义异常，而不是直接修改 err.error
    handler.next(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: httpException, // 这里将自定义的 HttpException 传递给 error 属性
    ));
  }
}