import 'package:blue_book/view/root-page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:blue_book/pack/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectInfo project;

  ProjectDetailsPage({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title ?? '项目详情'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SearchPage()),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('标题'),
                subtitle: Text(project.title ?? '未知'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('描述'),
                subtitle: Text(project.description ?? '暂无'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('发起者'),
                subtitle: Text(project.owner ?? '未知'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('人数'),
                subtitle: Text(project.numbers ?? '未知'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('类型'),
                subtitle: Text(project.types),
              ),
            ),
            // 根据需要添加更多信息
          ],
        ),
      ),
    );
  }
}