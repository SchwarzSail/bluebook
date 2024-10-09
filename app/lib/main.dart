import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blue_book/router/app_router.dart';
import 'package:get/get.dart';
import 'package:blue_book/config/color.dart';

void main() {
  runApp(MyApp());

  if (Platform.isIOS) {
    // 沉浸式状态栏
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,

      /// 这是设置状态栏的图标和字体的颜色
      /// Brightness.light  一般都是显示为白色
      /// Brightness.dark 一般都是显示为黑色
      statusBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  // 参考文档 https://api.flutter.dev/flutter/material/ThemeData-class.html
  final ThemeData _themeData = ThemeData(
    primaryColor: MyColor.primary, // 主题色
    scaffoldBackgroundColor: MyColor.page, // 脚手架下的页面背景色
    indicatorColor: MyColor.active, // 选项卡栏中所选选项卡指示器的颜色。
    // ElevatedButton 主题
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // 文字颜色
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white;
          } else {
            return null;
          }
        }),
        // 背景色
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColor.danger.withOpacity(0.5);
          } else {
            return MyColor.danger;
          }
        }),
      ),
    ),
    secondaryHeaderColor: MyColor.primary,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.white.withOpacity(0.5),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: MyColor.unactive,
      ),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: MyColor.unactive,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(
        fontSize: 18,
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 12),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: MyColor.nav,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColor.nav,
      selectedItemColor: MyColor.active,
      unselectedItemColor: MyColor.unactive,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '蓝书 App',
      theme: _themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      unknownRoute: AppRouter.unknownRoute,
      getPages: AppRouter.getPages,
    );
  }
}
