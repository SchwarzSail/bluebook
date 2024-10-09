import 'package:dio/dio.dart';
import 'package:blue_book/config/http_option.dart';

import 'interceptor.dart';

// http 请求单例类
class HttpRequest {
  // 工厂构造方法
  factory HttpRequest() => _instance;
  
  // 初始化一个单例实例
  static final HttpRequest _instance = HttpRequest._internal();
  
  // dio 实例
  late Dio dio;
  
  // 内部构造方法
  HttpRequest._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpOptions.baseURL,
      connectTimeout: Duration(milliseconds: HttpOptions.connectTimeout),  // 使用 Duration
      receiveTimeout: Duration(milliseconds: HttpOptions.receiveTimeout),  // 使用 Duration
      headers: {},
    );
    
    // 创建 dio 实例
    dio = Dio(baseOptions);
    
    // 添加拦截器
    dio.interceptors.add(HttpInterceptor());
  }

  /// 初始化公共属性 如果需要覆盖原配置项 就调用它
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时
  /// [receiveTimeout] 接收超时
  /// [headers] 请求头
  /// [interceptors] 基础拦截器
  void init({
    required String baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options.baseUrl = baseUrl;
    
    // 设置连接和接收超时时间，使用 Duration
    if (connectTimeout != null) {
      dio.options.connectTimeout = Duration(milliseconds: connectTimeout);
    }
    
    if (receiveTimeout != null) {
      dio.options.receiveTimeout = Duration(milliseconds: receiveTimeout);
    }

    if (headers != null) {
      dio.options.headers = headers;
    }

    // 添加自定义拦截器
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// 设置请求头
  void setHeaders(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  CancelToken _cancelToken = CancelToken();

  /*
   * 取消请求
   *
   * 同一个 cancel token 可以用于多个请求
   * 当一个 cancel token 取消时，所有使用该 cancel token 的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({CancelToken? token}) {
    (token ?? _cancelToken).cancel("cancelled");
  }

  /// 设置鉴权请求头
  Options setAuthorizationHeader(Options requestOptions) {
    // 这里可以动态设置 token
    String? token; // 如果有 token 需要动态赋值
    token = 'your_token';

    // 确保 token 不为 null，然后设置 Authorization header
    if (token.isNotEmpty) {
      requestOptions.headers ??= {}; // 确保 headers 不为 null
      requestOptions.headers!['Authorization'] = 'Bearer $token'; // 添加 Authorization 信息
    }
    
    return requestOptions;
  }

  /// restful get 操作
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options ?? Options());

    Response response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options ?? Options());

    Response response = await dio.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options ?? Options());

    Response response = await dio.post(
      path,
      data: FormData.fromMap(params ?? {}),
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }
}
