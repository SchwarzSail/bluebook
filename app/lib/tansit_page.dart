import 'dart:async';

import 'package:flutter/material.dart';
import 'package:blue_book/config/color.dart';
import 'package:blue_book/router/app_routes.dart';
import 'package:get/get.dart';

// 过渡页
class TansitPage extends StatefulWidget {
  TansitPage({Key? key}) : super(key: key);

  @override
  TansitPageState createState() => TansitPageState();
}

class TansitPageState extends State<TansitPage> {
  Timer _timer = Timer(Duration.zero, () {});
  int _currentTime = 6;

  @override
  void initState() {
    super.initState();
    // 倒计时
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if (_currentTime <= 0) {
        timer.cancel();
        print("Skip button clicked");
        Get.offNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/common/start_page.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: InkWell(
              child: Chip(
                label: Column(
                  children: [
                    Text('跳过'),
                    Text('${_currentTime}s'),
                  ],
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                backgroundColor: MyColor.active,
              ),
              onTap: () {
                _timer.cancel();
                Get.offNamed(AppRoutes.login);
              },
            ),
          ),
        ],
      ),
    );
  }
}
