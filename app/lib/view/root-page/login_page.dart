import 'package:blue_book/api/user.dart';
import 'package:blue_book/pack/user.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:blue_book/view/root-page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    final String studentId = _studentIdController.text;
    final String password = _passwordController.text;
    try {
      var response = await UserAPI.sendLoginReq(studentId, password);
       if (!mounted) return;
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final loginResponse = LoginResponse.fromJson(responseBody);
        if (loginResponse.base?.code == 10000) {
          // 登录成功，保存token并跳转到主页
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', loginResponse.token!);
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AppPage()),
          );
        } else {
          // 登录失败，显示错误消息
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('请检查学号和密码是否正确')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('登录异常，请稍后再试')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _studentIdController,
              decoration: InputDecoration(labelText: '学号'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '密码'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: login,
              child: Text('登录'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('还没有账号？点击去注册'),
            ),
            Text('我已阅读并同意服务协议和隐私政策'),
          ],
        ),
      ),
    );
  }
}