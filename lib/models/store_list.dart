import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/store_list.g.dart';
import 'dart:convert';

@JsonSerializable()
class StoreList {

	late int id;
	late int userId;
	late String username;
	late String contactName;
	late String contactTel;
	late String buyerName;
	late int provinceId;
	late int cityId;
	late int regionId;
	late String provinceName;
	late String cityName;
	late String regionName;
	late int belongOperationUserId;
	late String belongOperationName;
	late String locationLng;
	late String locationLat;
	late String address;
	late int distance;
	late String distanceStr;
	late int isLineRouter;
	late String headImg;
	late String firstHeadImg;
	late String lastVisitTime;
	late int lastVisitTimeType;
	dynamic lastCreateOrderTime;
	late int cityLevel;
	late String cityLevelDesc;
	dynamic businessDistrictType;
	dynamic businessDistrictTypeDesc;
	dynamic age;
	dynamic gender;
	dynamic socialMediaListDesc;
	dynamic whatsappAccount;
	dynamic mobilePhoneType;
	dynamic mobilePhoneTypeDesc;
	dynamic email;
	dynamic storeAreaDesc;
	dynamic mainCategoryDesc;
	dynamic retailerTypeDesc;
	dynamic retailerTypeCustom;
  
  StoreList();

  factory StoreList.fromJson(Map<String, dynamic> json) => $StoreListFromJson(json);

  Map<String, dynamic> toJson() => $StoreListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}