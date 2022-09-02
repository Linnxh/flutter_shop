import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/models/news.dart';

News $NewsFromJson(Map<String, dynamic> json) {
	final News news = News();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		news.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		news.title = title;
	}
	final dynamic? content = jsonConvert.convert<dynamic>(json['content']);
	if (content != null) {
		news.content = content;
	}
	final dynamic? description = jsonConvert.convert<dynamic>(json['description']);
	if (description != null) {
		news.description = description;
	}
	final dynamic? seo = jsonConvert.convert<dynamic>(json['seo']);
	if (seo != null) {
		news.seo = seo;
	}
	final dynamic? sort = jsonConvert.convert<dynamic>(json['sort']);
	if (sort != null) {
		news.sort = sort;
	}
	final dynamic? modifierId = jsonConvert.convert<dynamic>(json['modifierId']);
	if (modifierId != null) {
		news.modifierId = modifierId;
	}
	final dynamic? creatorId = jsonConvert.convert<dynamic>(json['creatorId']);
	if (creatorId != null) {
		news.creatorId = creatorId;
	}
	final dynamic? headImg = jsonConvert.convert<dynamic>(json['headImg']);
	if (headImg != null) {
		news.headImg = headImg;
	}
	final dynamic? keyword = jsonConvert.convert<dynamic>(json['keyword']);
	if (keyword != null) {
		news.keyword = keyword;
	}
	final dynamic? gmtCreate = jsonConvert.convert<dynamic>(json['gmtCreate']);
	if (gmtCreate != null) {
		news.gmtCreate = gmtCreate;
	}
	final dynamic? gmtModified = jsonConvert.convert<dynamic>(json['gmtModified']);
	if (gmtModified != null) {
		news.gmtModified = gmtModified;
	}
	final dynamic? articleCategoryId = jsonConvert.convert<dynamic>(json['articleCategoryId']);
	if (articleCategoryId != null) {
		news.articleCategoryId = articleCategoryId;
	}
	final dynamic? author = jsonConvert.convert<dynamic>(json['author']);
	if (author != null) {
		news.author = author;
	}
	final dynamic? link = jsonConvert.convert<dynamic>(json['link']);
	if (link != null) {
		news.link = link;
	}
	final dynamic? type = jsonConvert.convert<dynamic>(json['type']);
	if (type != null) {
		news.type = type;
	}
	final dynamic? tag = jsonConvert.convert<dynamic>(json['tag']);
	if (tag != null) {
		news.tag = tag;
	}
	final dynamic? isDeleted = jsonConvert.convert<dynamic>(json['isDeleted']);
	if (isDeleted != null) {
		news.isDeleted = isDeleted;
	}
	final dynamic? sellerUserId = jsonConvert.convert<dynamic>(json['sellerUserId']);
	if (sellerUserId != null) {
		news.sellerUserId = sellerUserId;
	}
	final dynamic? sellerName = jsonConvert.convert<dynamic>(json['sellerName']);
	if (sellerName != null) {
		news.sellerName = sellerName;
	}
	final dynamic? status = jsonConvert.convert<dynamic>(json['status']);
	if (status != null) {
		news.status = status;
	}
	return news;
}

Map<String, dynamic> $NewsToJson(News entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['description'] = entity.description;
	data['seo'] = entity.seo;
	data['sort'] = entity.sort;
	data['modifierId'] = entity.modifierId;
	data['creatorId'] = entity.creatorId;
	data['headImg'] = entity.headImg;
	data['keyword'] = entity.keyword;
	data['gmtCreate'] = entity.gmtCreate;
	data['gmtModified'] = entity.gmtModified;
	data['articleCategoryId'] = entity.articleCategoryId;
	data['author'] = entity.author;
	data['link'] = entity.link;
	data['type'] = entity.type;
	data['tag'] = entity.tag;
	data['isDeleted'] = entity.isDeleted;
	data['sellerUserId'] = entity.sellerUserId;
	data['sellerName'] = entity.sellerName;
	data['status'] = entity.status;
	return data;
}