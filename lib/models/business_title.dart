import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/business_title.g.dart';
import 'dart:convert';

@JsonSerializable()
class BusinessTitle {

	late double current;
	late double previous;
	late String title;
	dynamic rate;
	late String value;
  
  BusinessTitle();

  factory BusinessTitle.fromJson(Map<String, dynamic> json) => $BusinessTitleFromJson(json);

  Map<String, dynamic> toJson() => $BusinessTitleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}