import 'dart:async';

import 'package:flutter/material.dart';

class Utils {
  static String getImgPath(String name, {String format = 'png'}) {
    if (name.startsWith('lib/assets')) {
      return name;
    } else {
      return 'lib/assets/images/$name.$format';
    }
  }

  /// 获取语言的名称
  static String getLanguageName(Locale locale) {
    var locaeStr = locale.languageCode.toString();
    if (locaeStr == 'en') {
      return 'English';
    } else if (locaeStr == 'zh') {
      return '简体中文';
    }
    return '';
  }

  /// 语言对应的数字
  static int getLanguageCode(Locale locale) {
    var locaeStr = locale.languageCode.toString();
    if (locaeStr == 'en') {
      return 3;
    } else if (locaeStr == 'zh') {
      return 2;
    }
    return 1;
  }

  /// 手机号脱敏
  static String getEnMobilePhone(String phoneNum) {
    return phoneNum.replaceFirst(RegExp(r'\d{4}'), '****', 2);
  }

  /// 按钮防止重复点击
  static debounce(Function? fn, [int t = 1000]) {
    Timer? debounce;
    return () {
      // 还在时间之内，抛弃上一次
      if (debounce?.isActive ?? false) {
        debounce?.cancel();
      } else {
        fn?.call();
      }
      debounce = Timer(Duration(milliseconds: t), () {
        debounce?.cancel();
        debounce = null;
      });
    };
  }
}
