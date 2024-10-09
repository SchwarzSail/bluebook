import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
            Text('张三'),
            Text('计算机与大数据学院 - 学生'),
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
