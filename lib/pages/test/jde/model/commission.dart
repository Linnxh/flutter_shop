class CommissionModel {
  double? balanceAccount;
  double? pendingSettlementAmount;

  CommissionModel(this.balanceAccount, this.pendingSettlementAmount);

  CommissionModel.fromJson(Map<String, dynamic> json) {
    balanceAccount = json["balanceAccount"];
    pendingSettlementAmount = json["pendingSettlementAmount"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['balanceAccount'] = balanceAccount;
    data['pendingSettlementAmount'] = pendingSettlementAmount;
    return data;
  }
}
