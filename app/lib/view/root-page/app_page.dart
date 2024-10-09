import 'package:flutter/material.dart';
import 'package:blue_book/view/root-page/home_page.dart';
import 'package:blue_book/view/root-page/project_page.dart';
import 'package:blue_book/view/root-page/search_page.dart';
import 'package:blue_book/view/root-page/profile_page.dart';

// 导航资源集合
const List<Map> _bottomBarList = [
  {
    'icon': 'message.png',
    'activeIcon': 'message_active.png',
    'label': '消息',
  },
  {
    'icon': 'edit.png',
    'activeIcon': 'edit_active.png',
    'label': '发起项目',
  },
  {
    'icon': 'search.png',
    'activeIcon': 'search_active.png',
    'label': '搜索项目',
  },
  {
    'icon': 'user.png',
    'activeIcon': 'user_active.png',
    'label': '我的',
  }
];

// 应用根页面
class AppPage extends StatefulWidget {
  AppPage({Key? key}) : super(key: key);

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  // 当前选中页面索引
  int _currentIndex = 0;

  // 页面集合
  final List<Widget> _pageList = [
    HomePage(),
    ProjectPage(),
    SearchPage(),
    ProfilePage(),
  ];


  // 生成底部导航
  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    return _bottomBarList.map((item) {
      return BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icon/${item['icon']}',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'assets/icon/${item['activeIcon']}',
          width: 24,
          height: 24,
        ),
        label: item['label'],
        tooltip: '',
      );
    }).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
