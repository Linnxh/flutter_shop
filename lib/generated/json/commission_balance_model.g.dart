import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/pages/test/jde/model/commission_balance_model.dart';

CommissionBalanceModel $CommissionBalanceModelFromJson(Map<String, dynamic> json) {
	final CommissionBalanceModel commissionBalanceModel = CommissionBalanceModel();
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		commissionBalanceModel.userId = userId;
	}
	final double? balanceAccount = jsonConvert.convert<double>(json['balanceAccount']);
	if (balanceAccount != null) {
		commissionBalanceModel.balanceAccount = balanceAccount;
	}
	return commissionBalanceModel;
}

Map<String, dynamic> $CommissionBalanceModelToJson(CommissionBalanceModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['balanceAccount'] = entity.balanceAccount;
	return data;
}