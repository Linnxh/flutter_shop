import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/models/store_list.dart';

StoreList $StoreListFromJson(Map<String, dynamic> json) {
	final StoreList storeList = StoreList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		storeList.id = id;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		storeList.userId = userId;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		storeList.username = username;
	}
	final String? contactName = jsonConvert.convert<String>(json['contactName']);
	if (contactName != null) {
		storeList.contactName = contactName;
	}
	final String? contactTel = jsonConvert.convert<String>(json['contactTel']);
	if (contactTel != null) {
		storeList.contactTel = contactTel;
	}
	final String? buyerName = jsonConvert.convert<String>(json['buyerName']);
	if (buyerName != null) {
		storeList.buyerName = buyerName;
	}
	final int? provinceId = jsonConvert.convert<int>(json['provinceId']);
	if (provinceId != null) {
		storeList.provinceId = provinceId;
	}
	final int? cityId = jsonConvert.convert<int>(json['cityId']);
	if (cityId != null) {
		storeList.cityId = cityId;
	}
	final int? regionId = jsonConvert.convert<int>(json['regionId']);
	if (regionId != null) {
		storeList.regionId = regionId;
	}
	final String? provinceName = jsonConvert.convert<String>(json['provinceName']);
	if (provinceName != null) {
		storeList.provinceName = provinceName;
	}
	final String? cityName = jsonConvert.convert<String>(json['cityName']);
	if (cityName != null) {
		storeList.cityName = cityName;
	}
	final String? regionName = jsonConvert.convert<String>(json['regionName']);
	if (regionName != null) {
		storeList.regionName = regionName;
	}
	final int? belongOperationUserId = jsonConvert.convert<int>(json['belongOperationUserId']);
	if (belongOperationUserId != null) {
		storeList.belongOperationUserId = belongOperationUserId;
	}
	final String? belongOperationName = jsonConvert.convert<String>(json['belongOperationName']);
	if (belongOperationName != null) {
		storeList.belongOperationName = belongOperationName;
	}
	final String? locationLng = jsonConvert.convert<String>(json['locationLng']);
	if (locationLng != null) {
		storeList.locationLng = locationLng;
	}
	final String? locationLat = jsonConvert.convert<String>(json['locationLat']);
	if (locationLat != null) {
		storeList.locationLat = locationLat;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		storeList.address = address;
	}
	final int? distance = jsonConvert.convert<int>(json['distance']);
	if (distance != null) {
		storeList.distance = distance;
	}
	final String? distanceStr = jsonConvert.convert<String>(json['distanceStr']);
	if (distanceStr != null) {
		storeList.distanceStr = distanceStr;
	}
	final int? isLineRouter = jsonConvert.convert<int>(json['isLineRouter']);
	if (isLineRouter != null) {
		storeList.isLineRouter = isLineRouter;
	}
	final String? headImg = jsonConvert.convert<String>(json['headImg']);
	if (headImg != null) {
		storeList.headImg = headImg;
	}
	final String? firstHeadImg = jsonConvert.convert<String>(json['firstHeadImg']);
	if (firstHeadImg != null) {
		storeList.firstHeadImg = firstHeadImg;
	}
	final String? lastVisitTime = jsonConvert.convert<String>(json['lastVisitTime']);
	if (lastVisitTime != null) {
		storeList.lastVisitTime = lastVisitTime;
	}
	final int? lastVisitTimeType = jsonConvert.convert<int>(json['lastVisitTimeType']);
	if (lastVisitTimeType != null) {
		storeList.lastVisitTimeType = lastVisitTimeType;
	}
	final dynamic? lastCreateOrderTime = jsonConvert.convert<dynamic>(json['lastCreateOrderTime']);
	if (lastCreateOrderTime != null) {
		storeList.lastCreateOrderTime = lastCreateOrderTime;
	}
	final int? cityLevel = jsonConvert.convert<int>(json['cityLevel']);
	if (cityLevel != null) {
		storeList.cityLevel = cityLevel;
	}
	final String? cityLevelDesc = jsonConvert.convert<String>(json['cityLevelDesc']);
	if (cityLevelDesc != null) {
		storeList.cityLevelDesc = cityLevelDesc;
	}
	final dynamic? businessDistrictType = jsonConvert.convert<dynamic>(json['businessDistrictType']);
	if (businessDistrictType != null) {
		storeList.businessDistrictType = businessDistrictType;
	}
	final dynamic? businessDistrictTypeDesc = jsonConvert.convert<dynamic>(json['businessDistrictTypeDesc']);
	if (businessDistrictTypeDesc != null) {
		storeList.businessDistrictTypeDesc = businessDistrictTypeDesc;
	}
	final dynamic? age = jsonConvert.convert<dynamic>(json['age']);
	if (age != null) {
		storeList.age = age;
	}
	final dynamic? gender = jsonConvert.convert<dynamic>(json['gender']);
	if (gender != null) {
		storeList.gender = gender;
	}
	final dynamic? socialMediaListDesc = jsonConvert.convert<dynamic>(json['socialMediaListDesc']);
	if (socialMediaListDesc != null) {
		storeList.socialMediaListDesc = socialMediaListDesc;
	}
	final dynamic? whatsappAccount = jsonConvert.convert<dynamic>(json['whatsappAccount']);
	if (whatsappAccount != null) {
		storeList.whatsappAccount = whatsappAccount;
	}
	final dynamic? mobilePhoneType = jsonConvert.convert<dynamic>(json['mobilePhoneType']);
	if (mobilePhoneType != null) {
		storeList.mobilePhoneType = mobilePhoneType;
	}
	final dynamic? mobilePhoneTypeDesc = jsonConvert.convert<dynamic>(json['mobilePhoneTypeDesc']);
	if (mobilePhoneTypeDesc != null) {
		storeList.mobilePhoneTypeDesc = mobilePhoneTypeDesc;
	}
	final dynamic? email = jsonConvert.convert<dynamic>(json['email']);
	if (email != null) {
		storeList.email = email;
	}
	final dynamic? storeAreaDesc = jsonConvert.convert<dynamic>(json['storeAreaDesc']);
	if (storeAreaDesc != null) {
		storeList.storeAreaDesc = storeAreaDesc;
	}
	final dynamic? mainCategoryDesc = jsonConvert.convert<dynamic>(json['mainCategoryDesc']);
	if (mainCategoryDesc != null) {
		storeList.mainCategoryDesc = mainCategoryDesc;
	}
	final dynamic? retailerTypeDesc = jsonConvert.convert<dynamic>(json['retailerTypeDesc']);
	if (retailerTypeDesc != null) {
		storeList.retailerTypeDesc = retailerTypeDesc;
	}
	final dynamic? retailerTypeCustom = jsonConvert.convert<dynamic>(json['retailerTypeCustom']);
	if (retailerTypeCustom != null) {
		storeList.retailerTypeCustom = retailerTypeCustom;
	}
	return storeList;
}

Map<String, dynamic> $StoreListToJson(StoreList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['username'] = entity.username;
	data['contactName'] = entity.contactName;
	data['contactTel'] = entity.contactTel;
	data['buyerName'] = entity.buyerName;
	data['provinceId'] = entity.provinceId;
	data['cityId'] = entity.cityId;
	data['regionId'] = entity.regionId;
	data['provinceName'] = entity.provinceName;
	data['cityName'] = entity.cityName;
	data['regionName'] = entity.regionName;
	data['belongOperationUserId'] = entity.belongOperationUserId;
	data['belongOperationName'] = entity.belongOperationName;
	data['locationLng'] = entity.locationLng;
	data['locationLat'] = entity.locationLat;
	data['address'] = entity.address;
	data['distance'] = entity.distance;
	data['distanceStr'] = entity.distanceStr;
	data['isLineRouter'] = entity.isLineRouter;
	data['headImg'] = entity.headImg;
	data['firstHeadImg'] = entity.firstHeadImg;
	data['lastVisitTime'] = entity.lastVisitTime;
	data['lastVisitTimeType'] = entity.lastVisitTimeType;
	data['lastCreateOrderTime'] = entity.lastCreateOrderTime;
	data['cityLevel'] = entity.cityLevel;
	data['cityLevelDesc'] = entity.cityLevelDesc;
	data['businessDistrictType'] = entity.businessDistrictType;
	data['businessDistrictTypeDesc'] = entity.businessDistrictTypeDesc;
	data['age'] = entity.age;
	data['gender'] = entity.gender;
	data['socialMediaListDesc'] = entity.socialMediaListDesc;
	data['whatsappAccount'] = entity.whatsappAccount;
	data['mobilePhoneType'] = entity.mobilePhoneType;
	data['mobilePhoneTypeDesc'] = entity.mobilePhoneTypeDesc;
	data['email'] = entity.email;
	data['storeAreaDesc'] = entity.storeAreaDesc;
	data['mainCategoryDesc'] = entity.mainCategoryDesc;
	data['retailerTypeDesc'] = entity.retailerTypeDesc;
	data['retailerTypeCustom'] = entity.retailerTypeCustom;
	return data;
}