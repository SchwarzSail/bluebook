import 'base.dart';
class PublishResponse {
  Base? base;

  PublishResponse({this.base});

  PublishResponse.fromJson(Map<String, dynamic> json) {
    base = json['base'] != null ? Base.fromJson(json['base']) : null;
  }
}

class ProjectInfo {
  String? title;
  String? description;
  String? username; // 保留用于 'username' 字段
  String? owner; // 新增，用于 'owner' 字段
  String? numbers;
  String types; // 修改为 String 类型，因为 JSON 中是字符串

  ProjectInfo({
    this.title,
    this.description,
    this.username,
    this.owner,
    this.numbers,
    required this.types, // 确保 types 是必需的
  });

  factory ProjectInfo.fromJson(Map<String, dynamic> json) {
    return ProjectInfo(
      title: json['title'],
      description: json['description'],
      numbers: json['numbers'],
      username: json['username'] ,
      types: json['types'], // 直接读取字符串
    );
  }
}

class SearchResultResponse {
  Base? base;
  List<ProjectInfo>? projects;

  SearchResultResponse({this.base, this.projects});

  factory SearchResultResponse.fromJson(Map<String, dynamic> json) {
    var base = json['base'] != null ? Base.fromJson(json['base']) : null;
    var projectsJson = json['data'] as List<dynamic>?;
    var projects = projectsJson?.map((projectJson) => ProjectInfo.fromJson(projectJson)).toList();
    return SearchResultResponse(
      base: base,
      projects: projects,
    );
  }
}