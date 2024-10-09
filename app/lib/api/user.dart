import 'package:blue_book/http/http.dart';

class UserAPI {
  static const String rootPath = '/api/user';
  static const String registerPath = '$rootPath/register';
  static const String loginPath = '$rootPath/login';
  static const String resetPasswordPath = '$rootPath/reset_password';
	
  /// 用户注册
  static Future<void> register({
    required String username,
    required String email,
    required String account,
    required String password,
  }) async {
    try {
      var response = await HTTP.post(
        registerPath,
        data: {
          'username': username,
          'account': account,
          'email': email,
          'password': password,
        },
      );
      print('注册成功: $response');
    } catch (e) {
      print('注册失败: $e');
    }
  }

  /// 用户登录
  static Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await HTTP.post(
        loginPath,
        data: {
          'email': email,
          'password': password,
        },
      );
      print('登录成功: $response');
    } catch (e) {
      print('登录失败: $e');
    }
  }
  
  /// 重置密码
  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String resetCode,  // 假设后端要求验证码
  }) async {
    try {
      var response = await HTTP.post(
        resetPasswordPath,
        data: {
          'email': email,
          'newPassword': newPassword,
          'resetCode': resetCode,
        },
      );
      print('重置密码成功: $response');
    } catch (e) {
      print('重置密码失败: $e');
    }
  }
}
