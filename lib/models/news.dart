import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/news.g.dart';
import 'dart:convert';

@JsonSerializable()
class News {

	late int id;
	late String title;
	dynamic content;
	dynamic description;
	dynamic seo;
	dynamic sort;
	dynamic modifierId;
	dynamic creatorId;
	dynamic headImg;
	dynamic keyword;
	dynamic gmtCreate;
	dynamic gmtModified;
	dynamic articleCategoryId;
	dynamic author;
	dynamic link;
	dynamic type;
	dynamic tag;
	dynamic isDeleted;
	dynamic sellerUserId;
	dynamic sellerName;
	dynamic status;
  
  News();

  factory News.fromJson(Map<String, dynamic> json) => $NewsFromJson(json);

  Map<String, dynamic> toJson() => $NewsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}