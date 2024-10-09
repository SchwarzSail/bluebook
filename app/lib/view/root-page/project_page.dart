import 'package:flutter/material.dart';class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建项目'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '项目名称',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '项目人数',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '项目简介',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('项目Tag:'),
                Checkbox(value: true, onChanged: (value) {}),
                Text('生物'),
                Checkbox(value: false, onChanged: (value) {}),
                Text('计算机'),
              ],
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('机械'),
                Checkbox(value: true, onChanged: (value) {}),
                Text('人工智能'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('提交'),
            ),
          ],
        ),
      ),
    );
  }
}
