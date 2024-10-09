import 'package:dio/dio.dart';

import 'request.dart';

// http请求静态类
class HTTP {
  /// 初始化公共属性 如果需要覆盖原配置项 就调用它
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时的时间 (需使用 Duration 类型)
  /// [receiveTimeout] 接收超时的时间 (需使用 Duration 类型)
  /// [headers] 请求头
  /// [interceptors] 基础拦截器
  static void init({
    required String baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    HttpRequest().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? 30000,
      receiveTimeout: receiveTimeout ?? 30000,
      headers: headers ??{},
      interceptors: interceptors ??[],
    );
  }

  /// 设置请求头
  static void setHeaders(Map<String, dynamic> headers) {
    HttpRequest().setHeaders(headers);
  }

  /// 取消请求
  static void cancelRequests({CancelToken? token}) {
    HttpRequest().cancelRequests(token: token ?? CancelToken());
  }

  /// restful GET 操作
  static Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpRequest().get(
      path,
      params: params??{},
      options: options ?? Options(),
      cancelToken: cancelToken ?? CancelToken(),
    );
  }

  /// restful POST 操作
  static Future post(
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpRequest().post(
      path,
      params: params ??{},
      data: data,
      options: options ?? Options(),
      cancelToken: cancelToken ?? CancelToken(),
    );
  }

  /// restful POST 表单提交操作
  static Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpRequest().postForm(
      path,
      params: params ??{},
      options: options ?? Options(),
      cancelToken: cancelToken ?? CancelToken(),
    );
  }
}
