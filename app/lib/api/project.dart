import 'package:blue_book/http/http.dart';

class ProjectAPI {
  static const String rootPath = '/api/project';
  static const String publishPath = '$rootPath/publish';
  static const String infoPath = '$rootPath/info';
	
  /// 用户注册
  static Future<void> publish({
    required String username,
    required String email,
    required String account,
    required String password,
  }) async {
    try {
      var response = await HTTP.post(
        publishPath,
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
  static Future<void> info({
    required String email,
    required String password,
  }) async {
    try {
      var response = await HTTP.post(
        infoPath,
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
}
