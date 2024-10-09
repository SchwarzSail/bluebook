import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('忘记密码')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: '手机号'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              decoration: InputDecoration(labelText: '验证码'),
            ),
            TextField(
              decoration: InputDecoration(labelText: '新密码'),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(labelText: '确认密码'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // 重置密码逻辑
              },
              child: Text('重置密码'),
            ),
          ],
        ),
      ),
    );
  }
}