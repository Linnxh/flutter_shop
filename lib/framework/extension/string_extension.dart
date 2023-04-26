import 'package:flutter/material.dart';

extension StringExtension on String {
  /// 防止字符串自动换行
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}
