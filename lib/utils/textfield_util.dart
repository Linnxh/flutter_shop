import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/framework/my_color.dart';

class TextFieldUtil {
  /// 去除输入框的样式
  static InputDecoration noStyleDecoration(String hintText,
      {String? labelText, double? textSize}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      hintStyle:
          TextStyle(fontSize: textSize ?? 14.sp, color: MyColor.textGray4),
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
