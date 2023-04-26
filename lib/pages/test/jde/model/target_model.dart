class TargetModel {
  int? mainRuleId;
  String? ruleName;
  int? goalVal;
  double? achievementVal;
  double? percentage;
  bool? isHealthy;
  String? gmtModified;
  String? gmtCreate;

  TargetModel(
      {this.mainRuleId,
      this.ruleName,
      this.goalVal,
      this.achievementVal,
      this.percentage,
      this.isHealthy,
      this.gmtModified,
      this.gmtCreate});

  TargetModel.fromJson(Map<String, dynamic> json) {
    mainRuleId = json['mainRuleId'];
    ruleName = json['ruleName'];
    goalVal = json['goalVal'];
    achievementVal = json['achievementVal'];
    percentage = json['percentage'];
    isHealthy = json['isHealthy'];
    gmtModified = json['gmtModified'];
    gmtCreate = json['gmtCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mainRuleId'] = this.mainRuleId;
    data['ruleName'] = this.ruleName;
    data['goalVal'] = this.goalVal;
    data['achievementVal'] = this.achievementVal;
    data['percentage'] = this.percentage;
    data['isHealthy'] = this.isHealthy;
    data['gmtModified'] = this.gmtModified;
    data['gmtCreate'] = this.gmtCreate;
    return data;
  }
}
