import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/models/visit_ranking.dart';

VisitRanking $VisitRankingFromJson(Map<String, dynamic> json) {
	final VisitRanking visitRanking = VisitRanking();
	final int? salesmanUserId = jsonConvert.convert<int>(json['salesmanUserId']);
	if (salesmanUserId != null) {
		visitRanking.salesmanUserId = salesmanUserId;
	}
	final String? salesmanName = jsonConvert.convert<String>(json['salesmanName']);
	if (salesmanName != null) {
		visitRanking.salesmanName = salesmanName;
	}
	final int? count = jsonConvert.convert<int>(json['count']);
	if (count != null) {
		visitRanking.count = count;
	}
	return visitRanking;
}

Map<String, dynamic> $VisitRankingToJson(VisitRanking entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['salesmanUserId'] = entity.salesmanUserId;
	data['salesmanName'] = entity.salesmanName;
	data['count'] = entity.count;
	return data;
}