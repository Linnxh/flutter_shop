import 'dart:convert';

import 'package:flutter_shop/models_base/api_response_entity.g.dart';

/// 参考链接 https://juejin.cn/post/7043721908801503269
/// 这个文件 需要放在单独的目录，防止每次重新生成代码被覆盖

class ApiResponseEntity<T> {
  late int code;
  late String msg;
  T? data;
  late bool success;
  late bool notSuccess;

  ApiResponseEntity();

  factory ApiResponseEntity.fromJson(Map<String, dynamic> json) =>
      $ApiResponseEntityFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
