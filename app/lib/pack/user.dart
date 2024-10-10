import 'base.dart';

class LoginResponse {
  Base? base;
  String? token;

  LoginResponse({this.base, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    base = json['base'] != null ? Base.fromJson(json['base']) : null;
    token = json['token'];
  }
}

class InfoResponse {
  Base? base;
  User? user; // 添加User模型

  InfoResponse({this.base, this.user});

  InfoResponse.fromJson(Map<String, dynamic> json) {
    base = json['base'] != null ? Base.fromJson(json['base']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null; // 解析User
  }
}

class User {
  String? account;
  String? password;
  String? name;
  String? role;

  User({this.account, this.password, this.name, this.role});

  User.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
  }
}