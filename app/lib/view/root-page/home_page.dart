import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
            ),
            title: Text('张三'),
            subtitle: Text('脑机接口项目组'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
            ),
            title: Text('脑机接口项目组'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown,
            ),
            title: Text('人工智能项目组'),
          ),
        ],
      ),
    );
  }
}
