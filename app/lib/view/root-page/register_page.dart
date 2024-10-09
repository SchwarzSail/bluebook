import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // 引入fluttertoast库用于显示提示信息
import 'package:blue_book/api/user.dart'; // 确保你已经正确导入UserAPI类

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> register() async {
    var response = await UserAPI.sendRegisterReq(
      _accountController.text,
      _passwordController.text,
      _roleController.text,
    );
    if (!mounted) return;
    if (response.statusCode == 200) {
      // 注册成功，跳转到登录页面
      Navigator.pop(context); // 假设登录页面是注册页面的前一个页面
    } else {
      // 注册失败，显示提示信息
      Fluttertoast.showToast(
        msg: "注册失败，请重试",
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
              controller: _roleController,
              decoration: InputDecoration(labelText: '身份'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _accountController,
              decoration: InputDecoration(labelText: '学号'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _majorController,
              decoration: InputDecoration(labelText: '专业'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '设置密码'),
              obscureText: true,
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
    _roleController.dispose();
    _accountController.dispose();
    _majorController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}