class Base {
  int? code;
  String? msg;

  Base({this.code, this.msg});

  Base.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
    };
  }
}
