import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/test/jde/model/commission.dart';
import 'package:flutter_shop/pages/test/jde/widget/CommissionCtrl.dart';

class JdeMainPage extends StatefulWidget {
  const JdeMainPage({Key? key}) : super(key: key);

  @override
  State<JdeMainPage> createState() => _JdeMainPageState();
}

class _JdeMainPageState extends State<JdeMainPage> {
  List mainDataList = [CommissionModel(10, 100)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jdeMain"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            var model = mainDataList[index];
            // 头部佣金统计信息 + 跳转入口
            if (model is CommissionModel) {
              return CommissionCtrl(model: model);
            }
          },
          itemCount: mainDataList.length),
    );
  }
}
