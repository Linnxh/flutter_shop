import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/visit_ranking.g.dart';
import 'dart:convert';

@JsonSerializable()
class VisitRanking {

	late int salesmanUserId;
	late String salesmanName;
	late int count;
  
  VisitRanking();

  factory VisitRanking.fromJson(Map<String, dynamic> json) => $VisitRankingFromJson(json);

  Map<String, dynamic> toJson() => $VisitRankingToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}