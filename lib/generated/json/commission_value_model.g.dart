import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/pages/test/jde/model/commission_valus_model.dart';

CommissionValueModel $CommissionValueModelFromJson(Map<String, dynamic> json) {
	final CommissionValueModel commissionModel = CommissionValueModel();
	final int? settlementAmount = jsonConvert.convert<int>(json['settlementAmount']);
	if (settlementAmount != null) {
		commissionModel.settlementAmount = settlementAmount;
	}
	final double? pendingSettlementAmount = jsonConvert.convert<double>(json['pendingSettlementAmount']);
	if (pendingSettlementAmount != null) {
		commissionModel.pendingSettlementAmount = pendingSettlementAmount;
	}
	final int? estimateSettlementAmount = jsonConvert.convert<int>(json['estimateSettlementAmount']);
	if (estimateSettlementAmount != null) {
		commissionModel.estimateSettlementAmount = estimateSettlementAmount;
	}
	final int? commissionOrderTotal = jsonConvert.convert<int>(json['commissionOrderTotal']);
	if (commissionOrderTotal != null) {
		commissionModel.commissionOrderTotal = commissionOrderTotal;
	}
	return commissionModel;
}

Map<String, dynamic> $CommissionValueModelToJson(CommissionValueModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['settlementAmount'] = entity.settlementAmount;
	data['pendingSettlementAmount'] = entity.pendingSettlementAmount;
	data['estimateSettlementAmount'] = entity.estimateSettlementAmount;
	data['commissionOrderTotal'] = entity.commissionOrderTotal;
	return data;
}