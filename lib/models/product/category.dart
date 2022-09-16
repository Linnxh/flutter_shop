import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/category.g.dart';
import 'dart:convert';

@JsonSerializable()
class Category {
  String? id;
  String? name;
  String? icon;
  String? categoryType;
  int? level;
  int? sort;
  int? parentId;
  dynamic isSelected;
  String? frontCategoryType;
  List<CategoryChildCategoryList>? childCategoryList;

  // 自定义属性
  bool isExpand = false;

  Category();

  factory Category.fromJson(Map<String, dynamic> json) =>
      $CategoryFromJson(json);

  Map<String, dynamic> toJson() => $CategoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CategoryChildCategoryList {
  String? id;
  String? name;
  String? icon;
  String? categoryType;
  int? level;
  int? sort;
  int? parentId;
  dynamic isSelected;
  String? frontCategoryType;
  dynamic childCategoryList;

  CategoryChildCategoryList();

  factory CategoryChildCategoryList.fromJson(Map<String, dynamic> json) =>
      $CategoryChildCategoryListFromJson(json);

  Map<String, dynamic> toJson() => $CategoryChildCategoryListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
