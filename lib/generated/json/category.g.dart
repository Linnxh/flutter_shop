import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/models/product/category.dart';

Category $CategoryFromJson(Map<String, dynamic> json) {
	final Category category = Category();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		category.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		category.name = name;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		category.icon = icon;
	}
	final String? categoryType = jsonConvert.convert<String>(json['categoryType']);
	if (categoryType != null) {
		category.categoryType = categoryType;
	}
	final int? level = jsonConvert.convert<int>(json['level']);
	if (level != null) {
		category.level = level;
	}
	final int? sort = jsonConvert.convert<int>(json['sort']);
	if (sort != null) {
		category.sort = sort;
	}
	final int? parentId = jsonConvert.convert<int>(json['parentId']);
	if (parentId != null) {
		category.parentId = parentId;
	}
	final dynamic? isSelected = jsonConvert.convert<dynamic>(json['isSelected']);
	if (isSelected != null) {
		category.isSelected = isSelected;
	}
	final String? frontCategoryType = jsonConvert.convert<String>(json['frontCategoryType']);
	if (frontCategoryType != null) {
		category.frontCategoryType = frontCategoryType;
	}
	final List<CategoryChildCategoryList>? childCategoryList = jsonConvert.convertListNotNull<CategoryChildCategoryList>(json['childCategoryList']);
	if (childCategoryList != null) {
		category.childCategoryList = childCategoryList;
	}
	final bool? isExpand = jsonConvert.convert<bool>(json['isExpand']);
	if (isExpand != null) {
		category.isExpand = isExpand;
	}
	return category;
}

Map<String, dynamic> $CategoryToJson(Category entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['icon'] = entity.icon;
	data['categoryType'] = entity.categoryType;
	data['level'] = entity.level;
	data['sort'] = entity.sort;
	data['parentId'] = entity.parentId;
	data['isSelected'] = entity.isSelected;
	data['frontCategoryType'] = entity.frontCategoryType;
	data['childCategoryList'] =  entity.childCategoryList?.map((v) => v.toJson()).toList();
	data['isExpand'] = entity.isExpand;
	return data;
}

CategoryChildCategoryList $CategoryChildCategoryListFromJson(Map<String, dynamic> json) {
	final CategoryChildCategoryList categoryChildCategoryList = CategoryChildCategoryList();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		categoryChildCategoryList.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		categoryChildCategoryList.name = name;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		categoryChildCategoryList.icon = icon;
	}
	final String? categoryType = jsonConvert.convert<String>(json['categoryType']);
	if (categoryType != null) {
		categoryChildCategoryList.categoryType = categoryType;
	}
	final int? level = jsonConvert.convert<int>(json['level']);
	if (level != null) {
		categoryChildCategoryList.level = level;
	}
	final int? sort = jsonConvert.convert<int>(json['sort']);
	if (sort != null) {
		categoryChildCategoryList.sort = sort;
	}
	final int? parentId = jsonConvert.convert<int>(json['parentId']);
	if (parentId != null) {
		categoryChildCategoryList.parentId = parentId;
	}
	final dynamic? isSelected = jsonConvert.convert<dynamic>(json['isSelected']);
	if (isSelected != null) {
		categoryChildCategoryList.isSelected = isSelected;
	}
	final String? frontCategoryType = jsonConvert.convert<String>(json['frontCategoryType']);
	if (frontCategoryType != null) {
		categoryChildCategoryList.frontCategoryType = frontCategoryType;
	}
	final dynamic? childCategoryList = jsonConvert.convert<dynamic>(json['childCategoryList']);
	if (childCategoryList != null) {
		categoryChildCategoryList.childCategoryList = childCategoryList;
	}
	return categoryChildCategoryList;
}

Map<String, dynamic> $CategoryChildCategoryListToJson(CategoryChildCategoryList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['icon'] = entity.icon;
	data['categoryType'] = entity.categoryType;
	data['level'] = entity.level;
	data['sort'] = entity.sort;
	data['parentId'] = entity.parentId;
	data['isSelected'] = entity.isSelected;
	data['frontCategoryType'] = entity.frontCategoryType;
	data['childCategoryList'] = entity.childCategoryList;
	return data;
}