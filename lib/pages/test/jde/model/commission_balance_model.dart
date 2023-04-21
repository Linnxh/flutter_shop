import 'package:flutter_shop/generated/json/base/json_field.dart';
import 'package:flutter_shop/generated/json/commission_balance_model.g.dart';
import 'dart:convert';

@JsonSerializable()
class CommissionBalanceModel {

	int? userId;
	double? balanceAccount;
  
  CommissionBalanceModel();

  factory CommissionBalanceModel.fromJson(Map<String, dynamic> json) => $CommissionBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => $CommissionBalanceModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}