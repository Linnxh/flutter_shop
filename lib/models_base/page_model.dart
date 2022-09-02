import 'dart:convert';
import 'package:flutter_shop/models_base/page_model.g.dart';

/// 分页模型
class PageModel<T> {
  late List<T>? records;
  late int total;
  late int size;
  late int current;
  late List<dynamic> orders;
  late bool optimizeCountSql;
  late bool searchCount;
  dynamic countId;
  dynamic maxLimit;
  late int pages;

  PageModel();

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      $PageModelFromJson<T>(json);

  Map<String, dynamic> toJson() => $PageModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
