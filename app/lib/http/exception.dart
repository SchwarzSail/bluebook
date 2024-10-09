import 'package:dio/dio.dart';

// 自定义 http 异常
class HttpException implements Exception {
  final int code;
  final String msg;

  HttpException({required this.code, required this.msg});
  @override
  String toString() {
    return "HttpError [$code]: $msg";
  }

  factory HttpException.create(DioException error) {
    // dio 异常
    switch (error.type) {
      case DioExceptionType.cancel:
        return HttpException(code: -1, msg: '请求取消');
      case DioExceptionType.connectionTimeout:
        return HttpException(code: -1, msg: '连接超时');
        
      case DioExceptionType.sendTimeout:
        return HttpException(code: -1, msg: '请求超时');
        
      case DioExceptionType.receiveTimeout:
        return HttpException(code: -1, msg: '响应超时');
      case DioExceptionType.badResponse:
      // 检查 statusCode 是否为 null
      final statusCode = error.response?.statusCode;
      if (statusCode != null) {
        switch (statusCode) {
          case 400:
            return HttpException(code: statusCode, msg: '请求语法错误');
          case 401:
            return HttpException(code: statusCode, msg: '没有权限');
          case 403:
            return HttpException(code: statusCode, msg: '服务器拒绝执行');
          case 404:
            return HttpException(code: statusCode, msg: '无法连接服务器');
          case 500:
            return HttpException(code: statusCode, msg: '服务器内部错误');
          case 502:
            return HttpException(code: statusCode, msg: '网关错误');
          default:
            return HttpException(code: statusCode, msg: '未知错误');
        }
      } else {
        // 处理没有 statusCode 的情况
        return HttpException(code: 0, msg: '未知服务器错误');
      }

      default:
        return HttpException(code: 500, msg: '其他错误');
    }
  }
}