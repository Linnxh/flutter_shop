import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/person_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PersonEntity {

	late int id;
	late String name;
	late int age;
  
  PersonEntity();

  factory PersonEntity.fromJson(Map<String, dynamic> json) => $PersonEntityFromJson(json);

  Map<String, dynamic> toJson() => $PersonEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}