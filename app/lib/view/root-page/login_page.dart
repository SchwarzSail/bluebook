import 'package:blue_book/api/user.dart';
import 'package:flutter/material.dart';

import 'package:blue_book/view/root-page/register_page.dart';
import 'package:blue_book/view/root-page/reset_password_page.dart';
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
      // 等待异步操作完成，并获取响应
      var response = await UserAPI.sendLoginReq(studentId, password);
      if (!mounted) return;
      if (response.statusCode == 200) {
        // 假设登录成功服务器返回200状态码
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppPage()), // 假设AppPage是登录后的主页面
        );
      } else {
        // 处理错误情况，例如显示一个错误消息
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('登录失败，请检查你的学号和密码是否正确')),
        );
      }
    } catch (e) {
      // 处理异步操作中的错误
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                  );
                },
                child: Text('忘记密码？'),
              ),
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