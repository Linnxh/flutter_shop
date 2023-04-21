import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/commission_value_model.g.dart';
import 'dart:convert';

@JsonSerializable()
class CommissionValueModel {

	int? settlementAmount;
	double? pendingSettlementAmount;
	int? estimateSettlementAmount;
	int? commissionOrderTotal;
  
  CommissionValueModel();

  factory CommissionValueModel.fromJson(Map<String, dynamic> json) => $CommissionValueModelFromJson(json);

  Map<String, dynamic> toJson() => $CommissionValueModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}