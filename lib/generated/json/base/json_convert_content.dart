// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_shop/models/business_title.dart';
import 'package:flutter_shop/models/news.dart';
import 'package:flutter_shop/models/person_entity.dart';
import 'package:flutter_shop/models/product/category.dart';
import 'package:flutter_shop/models/store_list.dart';
import 'package:flutter_shop/models/visit_ranking.dart';
import 'package:flutter_shop/pages/test/jde/model/commission_balance_model.dart';
import 'package:flutter_shop/pages/test/jde/model/commission_valus_model.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(BusinessTitle).toString(): BusinessTitle.fromJson,
		(News).toString(): News.fromJson,
		(PersonEntity).toString(): PersonEntity.fromJson,
		(Category).toString(): Category.fromJson,
		(CategoryChildCategoryList).toString(): CategoryChildCategoryList.fromJson,
		(StoreList).toString(): StoreList.fromJson,
		(VisitRanking).toString(): VisitRanking.fromJson,
		(CommissionBalanceModel).toString(): CommissionBalanceModel.fromJson,
		(CommissionValueModel).toString(): CommissionValueModel.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<BusinessTitle>[] is M){
			return data.map<BusinessTitle>((Map<String, dynamic> e) => BusinessTitle.fromJson(e)).toList() as M;
		}
		if(<News>[] is M){
			return data.map<News>((Map<String, dynamic> e) => News.fromJson(e)).toList() as M;
		}
		if(<PersonEntity>[] is M){
			return data.map<PersonEntity>((Map<String, dynamic> e) => PersonEntity.fromJson(e)).toList() as M;
		}
		if(<Category>[] is M){
			return data.map<Category>((Map<String, dynamic> e) => Category.fromJson(e)).toList() as M;
		}
		if(<CategoryChildCategoryList>[] is M){
			return data.map<CategoryChildCategoryList>((Map<String, dynamic> e) => CategoryChildCategoryList.fromJson(e)).toList() as M;
		}
		if(<StoreList>[] is M){
			return data.map<StoreList>((Map<String, dynamic> e) => StoreList.fromJson(e)).toList() as M;
		}
		if(<VisitRanking>[] is M){
			return data.map<VisitRanking>((Map<String, dynamic> e) => VisitRanking.fromJson(e)).toList() as M;
		}
		if(<CommissionBalanceModel>[] is M){
			return data.map<CommissionBalanceModel>((Map<String, dynamic> e) => CommissionBalanceModel.fromJson(e)).toList() as M;
		}
		if(<CommissionValueModel>[] is M){
			return data.map<CommissionValueModel>((Map<String, dynamic> e) => CommissionValueModel.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}