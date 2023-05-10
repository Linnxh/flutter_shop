import 'package:flutter/material.dart';
import 'package:flutter_shop/framework/my_color.dart';
import 'package:flutter_shop/pages/test/jde/model/target_model.dart';

/// 目标达成 - 进度条
class TargetProgressItem extends StatefulWidget {
  final TargetModel model;

  const TargetProgressItem({required this.model, Key? key}) : super(key: key);

  @override
  State<TargetProgressItem> createState() => _TargetProgressItemState();
}

class _TargetProgressItemState extends State<TargetProgressItem> {
  @override
  Widget build(BuildContext context) {
    double percent = widget.model.percentage ?? 0;
    var percentInt = percent.toInt();
    var progressHeight = 14.0;
    return Stack(
      children: [
        /// 底层
        Container(
          height: progressHeight,
          decoration: BoxDecoration(
              color: MyColor.C_f5f6f8, borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.centerRight,
        ),

        /// 上层
        Container(
          height: progressHeight,
          margin: EdgeInsets.only(top: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: percentInt,
                  // 进度条进度层
                  child: Container(
                      decoration: BoxDecoration(
                          color: widget.model.isHealthy == true
                              ? MyColor.C_06BA8A
                              : MyColor.C_ff9a12,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.centerRight,

                      /// 文字
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          percent.toString(),
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        ),
                      ))),
              Expanded(
                  flex: 100 - percentInt,
                  child: Container(color: Colors.transparent))
            ],
          ),
        ),
      ],
    );
  }
}
