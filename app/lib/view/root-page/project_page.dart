import 'dart:convert';
import 'package:blue_book/pack/project.dart';
import 'package:flutter/material.dart';
import 'package:blue_book/api/project.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectPage extends StatefulWidget {
  @override
  ProjectPageState createState() => ProjectPageState();
}

class ProjectPageState extends State<ProjectPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _typesController = TextEditingController();
  final TextEditingController _countController = TextEditingController();

  Future<void> submitProject() async {
    final String title = _titleController.text;
    final String desc = _descriptionController.text;
    final String username = _usernameController.text;
    final List<String> types = _typesController.text.split(','); // 假设用户通过逗号分隔输入多个类型
    final int count = int.tryParse(_countController.text) ?? 0; // 默认值为0

      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
        var response = await ProjectAPI.sendCreateProjectReq(token!, title, desc, types,username, count);
        if (response.statusCode == 200) {
          final responseBody = json.decode(response.body);
          final publishResponse = PublishResponse.fromJson(responseBody);
          if (publishResponse.base?.code == 10000) {
            if (!mounted) { return; }
            print('发起项目成功');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('发起项目成功')),
            );
          } else {
            print('发起项目失败');
            if (!mounted) { return; }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('发起项目失败')),
            );
          }
        } else {
          print('服务器错误');
        }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建项目'),
      ),
      body: SingleChildScrollView( // 使用SingleChildScrollView防止溢出
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: '项目标题',
                border: OutlineInputBorder(), // 添加边框
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: '项目简介',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _typesController,
              decoration: InputDecoration(
                labelText: '项目类型（逗号分隔）',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _countController,
              decoration: InputDecoration(
                labelText: '人数',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitProject,
              child: Text('提交'),
            ),
          ],
        ),
      ),
    );
  }
}