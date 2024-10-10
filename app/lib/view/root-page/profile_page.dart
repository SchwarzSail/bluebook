import 'package:blue_book/pack/user.dart';
import 'package:flutter/material.dart';
import 'package:blue_book/api/user.dart'; // 确保你已经创建了这个路径和文件
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String _name = '加载中...';
  String _role = '加载中...';

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  void _fetchUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        var response = await UserAPI.sendGetInfoReq(token);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          var userInfo = InfoResponse.fromJson(data);
          setState(() {
            _name = userInfo.user?.name ?? '052101418';
            _role = userInfo.user?.role ?? 'ricky';
          });
        } else {
          // 处理错误情况
          print('获取用户信息失败');
        }
      } else {
        print('Token为空');
      }
    } catch (e) {
      print('获取Token或用户信息时发生错误: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.greenAccent,
            ),
            SizedBox(height: 10),
            Text(_name), // 使用变量
            Text(_role), // 使用变量
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('我的项目'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('好友列表'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('修改个人信息'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}