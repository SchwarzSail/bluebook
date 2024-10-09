import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
              decoration: InputDecoration(labelText: '身份'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: InputDecoration(labelText: '学号'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              decoration: InputDecoration(labelText: '专业'),
            ),
            TextField(
              decoration: InputDecoration(labelText: '设置密码'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // 注册逻辑
              },
              child: Text('注册'),
            ),
          ],
        ),
      ),
    );
  }
}