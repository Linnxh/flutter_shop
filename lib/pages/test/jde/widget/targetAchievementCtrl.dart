import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_shop/framework/my_color.dart';
import 'package:flutter_shop/pages/test/jde/model/target_model.dart';
import 'package:flutter_shop/pages/test/jde/view/RadioCornerButton.dart';
import 'package:flutter_shop/pages/test/jde/widget/target_progress_item.dart';

class TargetAchievementCtrl extends StatefulWidget {
  final TargetModel model;

  const TargetAchievementCtrl({required this.model, Key? key})
      : super(key: key);

  @override
  State<TargetAchievementCtrl> createState() => _TargetAchievementCtrlState();
}

class _TargetAchievementCtrlState extends State<TargetAchievementCtrl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: _getList(widget.model),
      ),
    );
  }
}

List<Widget> _getList(TargetModel model) {
  List<Widget> list = [];
  // 标题栏
  list.add(TargetTitleView());
  list.add(SizedBox(height: 10));
  // 时间选择栏
  list.add(TargetTimeView());
  // 列表项
  List<TargetModel> modelList = [
    TargetModel(goalVal: 10, percentage: 50, isHealthy: true),
    TargetModel(goalVal: 100, percentage: 40, isHealthy: false),
    TargetModel(goalVal: 230, percentage: 80, isHealthy: true)
  ];
  for (var element in modelList) {
    list.add(TargetProgressItem(model: element));
  }
  // 小结
  list.add(TargetSummary());
  return list;
}

/// 标题栏
class TargetTitleView extends StatefulWidget {
  const TargetTitleView({Key? key}) : super(key: key);

  @override
  State<TargetTitleView> createState() => _TargetTitleViewState();
}

class _TargetTitleViewState extends State<TargetTitleView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "My Target Achievement",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 3,
            ),
            Image.asset("images/ic_yellow.png", width: 20, height: 20),
          ],
        ),
        Row(
          children: [
            Text(
              "More Data",
              style: TextStyle(
                fontSize: 13,
                color: MyColor.mainColor,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Image.asset("images/ic_arrow_right.png", width: 6, height: 10)
          ],
        ),
      ],
    );
  }
}

/// 时间选择栏
class TargetTimeView extends StatefulWidget {
  const TargetTimeView({Key? key}) : super(key: key);

  @override
  State<TargetTimeView> createState() => _TargetTimeViewState();
}

class _TargetTimeViewState extends State<TargetTimeView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: MyColor.C_dfdcdc),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: [
              Text(
                "Date up to 08-2022",
                style: TextStyle(
                  fontSize: 12,
                  color: MyColor.mainColor,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Image.asset("images/ic_arrow_right.png", width: 6, height: 10)
            ],
          ),
        ),
        RadioCornerButton(
            isLeftDefaultCheck: true,
            leftCheckCall: () {},
            rightCheckCall: () {}),
      ],
    );
  }
}

/// 小结
class TargetSummary extends StatefulWidget {
  const TargetSummary({Key? key}) : super(key: key);

  @override
  State<TargetSummary> createState() => _TargetSummaryState();
}

class _TargetSummaryState extends State<TargetSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.centerRight,
      child: Text(
        "Data updated at 17:00",
        style: TextStyle(fontSize: 12, color: MyColor.C_958C8D),
      ),
    );
  }
}
