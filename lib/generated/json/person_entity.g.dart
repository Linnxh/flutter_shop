import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/models/person_entity.dart';

PersonEntity $PersonEntityFromJson(Map<String, dynamic> json) {
	final PersonEntity personEntity = PersonEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		personEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		personEntity.name = name;
	}
	final int? age = jsonConvert.convert<int>(json['age']);
	if (age != null) {
		personEntity.age = age;
	}
	return personEntity;
}

Map<String, dynamic> $PersonEntityToJson(PersonEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['age'] = entity.age;
	return data;
}