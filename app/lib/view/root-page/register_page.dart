import 'package:blue_book/pack/base.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // 引入fluttertoast库用于显示提示信息
import 'package:blue_book/api/user.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> register() async {
    var response = await UserAPI.sendRegisterReq(
      _accountController.text,
      _passwordController.text,
      _usernameController.text,
      _emailController.text,
    );
    if (!mounted) return;
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final baseResponse = Base.fromJson(responseBody);
      if (baseResponse.code == 10000) {
        // 注册成功
        Fluttertoast.showToast(
          msg: "注册成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      Navigator.pop(context); // 假设登录页面是注册页面的前一个页面
      }else{
        // 注册失败，显示错误消息
        Fluttertoast.showToast(
          msg: "请注意所有内容是否填写正确",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    } else {
      // 注册失败，显示提示信息
      Fluttertoast.showToast(
        msg: "服务器错误，请稍后再试",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注册')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _accountController,
              decoration: InputDecoration(labelText: '学号'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '设置密码'),
              obscureText: true,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: '名称'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: '邮箱'),
            ),
            ElevatedButton(
              onPressed: register,
              child: Text('注册'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 释放控制器资源
    _accountController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}