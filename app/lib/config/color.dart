import 'package:flutter/material.dart';

// 颜色配置
class MyColor {
  static const Color primary = Color(0xfffbfbfb);

  static const Color success = Color(0xff07c160);

  static const Color danger = Color(0xffee0a24);

  static const Color warning = Color(0xffffba00);

  static const Color info = Color(0xff00a1d6);

  static const Color active = Color(0xff464646);

  static const Color unactive = Color(0xff7b7b7b);

  static const Color un2active = Color(0xff8d8d8d);

  static const Color un3active = Color(0xffb1b1b1);

  static const Color page = Color(0xfff7f7f7);

  static const Color nav = Color(0xfffbfbfb);

  static const Color border = Color(0xfff5f5f5);

    // 颜色值转换
  static Color string2Color(String colorString) {
    int value = 0x00000000; // 默认值
    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }
      
      // 使用 tryParse 并处理返回的可空 int? 类型
      int? parsedValue = int.tryParse(colorString, radix: 16);
      
      // 如果解析成功，更新 value
      if (parsedValue != null) {
        value = parsedValue;
        
        // 如果 value 小于 0xFF000000，添加透明度（默认为不透明）
        if (value < 0xFF000000) {
          value += 0xFF000000;
        }
      }
    }
    return Color(value);
  }
}
