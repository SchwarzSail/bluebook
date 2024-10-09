import 'package:blue_book/http/http.dart';
import 'package:blue_book/view/root-page/register_page.dart';
import 'package:blue_book/view/root-page/reset_password_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
              decoration: InputDecoration(labelText: '学号'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
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
              onPressed: () {
                // 登录逻辑
              },
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