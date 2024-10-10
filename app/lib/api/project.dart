import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectAPI {
  static const String rootPath = '/book/project';
  static const String createProjectPath = '$rootPath/publish';
  static const String projectDetailsPath = '$rootPath/info';
  static const String searchPath = '$rootPath/search';

  /// 发起项目
  static Future<http.Response> sendCreateProjectReq(String token, String title, String desc,List<String> types,String username,int count) async {
    var url = Uri.parse('http://127.0.0.1:8080$createProjectPath');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
      body: jsonEncode(<String, Object>{
        'title': title,
        'description': desc,
        'types': types,
        'username': username,
        'count': count,
      }),
    );
    return response;
  }

  /// 获取项目详情
  static Future<http.Response> sendGetProjectDetailsReq(String token, String projectId) async {
    var url = Uri.parse('http://127.0.0.1:8080$projectDetailsPath/$projectId');
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );
    return response;
  }

  /// 搜索项目
  static Future<http.Response> sendSearchReq(String token, String keyword) async {
    var url = Uri.parse('http://127.0.0.1:8080$searchPath').replace(queryParameters: {'keyword': keyword});
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );
    return response;
  }
}