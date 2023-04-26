import 'package:flutter/material.dart';
import 'package:flutter_shop/framework/my_color.dart';

/// 单选按钮，切换

class RadioCornerButton extends StatefulWidget {
  bool isLeftDefaultCheck; //默认选中左边
  Function leftCheckCall; // 左侧选中
  Function rightCheckCall; // 右侧选中
  RadioCornerButton(
      {required this.isLeftDefaultCheck,
      required this.leftCheckCall,
      required this.rightCheckCall,
      Key? key})
      : super(key: key);

  @override
  State<RadioCornerButton> createState() => _RadioCornerButtonState();
}

class _RadioCornerButtonState extends State<RadioCornerButton> {
  bool isLeftChecked = false;

  @override
  void initState() {
    super.initState();
    isLeftChecked = widget.isLeftDefaultCheck;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: isLeftChecked
                ? BoxDecoration(
                    color: MyColor.mainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18)))
                : BoxDecoration(
                    color: MyColor.mainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18))),
            child: Text(
              "M",
              style: TextStyle(
                  fontSize: 14,
                  color: isLeftChecked ? Colors.white : MyColor.mainColor),
            ),
          ),

          /// 右侧的半圆角用的是容器类的padding
          Container(
            padding: EdgeInsets.fromLTRB(0, 1, 1, 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(18),
                  topRight: Radius.circular(18)),
              color: MyColor.C_dfdcdc,
            ),
            child: Container(
                padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  color: Colors.white,
                ),
                child: Text("Y",
                    style: TextStyle(
                        fontSize: 14,
                        color: isLeftChecked
                            ? MyColor.mainColor
                            : MyColor.white))),
          ),
        ],
      ),
    );
  }
}
