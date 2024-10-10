import 'dart:convert';

import 'package:blue_book/pack/project.dart';
import 'package:blue_book/view/root-page/project_detail.dart';
import 'package:flutter/material.dart';
import 'package:blue_book/api/project.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 假设这个API包含搜索项目的功能

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<ProjectInfo> _searchResults = []; // 定义搜索结果列表

   Future<void> searchProjects() async {
    final String query = _searchController.text;
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (query.isNotEmpty) {
      var response = await ProjectAPI.sendSearchReq(token!, query);
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final searchResultResponse = SearchResultResponse.fromJson(responseBody);
        if (searchResultResponse.base?.code == 10000) {
          setState(() {
            _searchResults = searchResultResponse.projects ?? [];
          });
        } else {
          if (!mounted) return;
          print(searchResultResponse.base?.code);
          print(searchResultResponse.base?.msg);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('搜索失败，请稍后再试')),
          );
        }
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('服务器错误，请稍后再试')),
        );
      }
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('搜索项目'),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: '搜索',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: searchProjects,
              ),
            ),
          ),
          SizedBox(height: 20),
          _searchResults.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final project = _searchResults[index];
                    return Card(
                      elevation: 4.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Icon(Icons.book, color: Theme.of(context).primaryColor),
                        title: Text(project.title!, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('类型: ${project.types}'),
                        onTap: () {
                          // 可以在这里添加点击项目后的操作，比如导航到项目详情页面
                           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ProjectDetailsPage(project: project)),
                           );
                        },
                      ),
                    );
                  },
                )
              : Center(child: Text('没有找到相关项目，请尝试其他关键词搜索。')),
        ],
      ),
    ),
  );
}
}