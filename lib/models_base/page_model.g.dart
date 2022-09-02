import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/models_base/page_model.dart';

import 'MyJsonConvert.dart';
import 'api_response_entity.dart';

PageModel<T> $PageModelFromJson<T>(Map<String, dynamic> json) {
  MyJsonConvert myJson = MyJsonConvert();
  final PageModel<T> pageModel = PageModel<T>();

  /// 解析数据的方法
  final List<T>? records = JsonConvert.fromJsonAsT(json['records']);

  if (records != null) {
    pageModel.records = records;
  }
  final int? total = myJson.convert<int>(json['total']);
  if (total != null) {
    pageModel.total = total;
  }
  final int? size = myJson.convert<int>(json['size']);
  if (size != null) {
    pageModel.size = size;
  }
  final int? current = myJson.convert<int>(json['current']);
  if (current != null) {
    pageModel.current = current;
  }
  final List<dynamic>? orders =
      myJson.convertListNotNull<dynamic>(json['orders']);
  if (orders != null) {
    pageModel.orders = orders;
  }
  final bool? optimizeCountSql = myJson.convert<bool>(json['optimizeCountSql']);
  if (optimizeCountSql != null) {
    pageModel.optimizeCountSql = optimizeCountSql;
  }
  final bool? searchCount = myJson.convert<bool>(json['searchCount']);
  if (searchCount != null) {
    pageModel.searchCount = searchCount;
  }
  final dynamic? countId = myJson.convert<dynamic>(json['countId']);
  if (countId != null) {
    pageModel.countId = countId;
  }
  final dynamic? maxLimit = myJson.convert<dynamic>(json['maxLimit']);
  if (maxLimit != null) {
    pageModel.maxLimit = maxLimit;
  }
  final int? pages = myJson.convert<int>(json['pages']);
  if (pages != null) {
    pageModel.pages = pages;
  }
  return pageModel;
}

Map<String, dynamic> $PageModelToJson(PageModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['records'] = entity.records;
  data['total'] = entity.total;
  data['size'] = entity.size;
  data['current'] = entity.current;
  data['orders'] = entity.orders;
  data['optimizeCountSql'] = entity.optimizeCountSql;
  data['searchCount'] = entity.searchCount;
  data['countId'] = entity.countId;
  data['maxLimit'] = entity.maxLimit;
  data['pages'] = entity.pages;
  return data;
}
