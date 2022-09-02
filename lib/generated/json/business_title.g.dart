import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/models/business_title.dart';

BusinessTitle $BusinessTitleFromJson(Map<String, dynamic> json) {
	final BusinessTitle businessTitle = BusinessTitle();
	final double? current = jsonConvert.convert<double>(json['current']);
	if (current != null) {
		businessTitle.current = current;
	}
	final double? previous = jsonConvert.convert<double>(json['previous']);
	if (previous != null) {
		businessTitle.previous = previous;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		businessTitle.title = title;
	}
	final dynamic? rate = jsonConvert.convert<dynamic>(json['rate']);
	if (rate != null) {
		businessTitle.rate = rate;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		businessTitle.value = value;
	}
	return businessTitle;
}

Map<String, dynamic> $BusinessTitleToJson(BusinessTitle entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current'] = entity.current;
	data['previous'] = entity.previous;
	data['title'] = entity.title;
	data['rate'] = entity.rate;
	data['value'] = entity.value;
	return data;
}