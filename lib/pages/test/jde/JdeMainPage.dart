import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/pages/tabs/Category.dart';
import 'package:flutter_shop/pages/test/jde/model/commission.dart';
import 'package:flutter_shop/pages/test/jde/model/news_model.dart';
import 'package:flutter_shop/pages/test/jde/model/target_model.dart';
import 'package:flutter_shop/pages/test/jde/widget/CommissionCtrl.dart';
import 'package:flutter_shop/pages/test/jde/widget/newCtrl.dart';
import 'package:flutter_shop/pages/test/jde/widget/targetAchievementCtrl.dart';

class JdeMainPage extends StatefulWidget {
  const JdeMainPage({Key? key}) : super(key: key);

  @override
  State<JdeMainPage> createState() => _JdeMainPageState();
}

class _JdeMainPageState extends State<JdeMainPage> {
  List mainDataList = [
    CommissionModel(10, 100),
    NewsModelList([
      NewsModel(10, "新闻内容实体，哈哈哈啊哈哈哈啊哈哈哈啊哈哈哈哈哈啊哈哈1111111111111111"),
      NewsModel(
          10, "新闻内容实体2222，哈哈哈啊哈哈哈啊哈哈哈啊哈哈哈哈哈啊哈哈222222222222222222222222222")
    ]),
    TargetModel(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title dark'),
      //   centerTitle: true,
      //   elevation: 0,
      //   bottom: null,
      //   backgroundColor: Colors.,
      //   // brightness: Brightness.dark,
      // ),

      appBar: AppBar(

          ///  注意页面状态栏的颜色变化，
          ///  main 中配置了 statusBarIconBrightness ：light -->> 浅色主题，
          ///  user 中配置了 statusBarIconBrightness ：dark
          ///  此处如果不设置 backgroundColor,状态栏的颜色会和user中保持一致（ 页面路径是 user-->> jdeMain 如果不设置会和user页面保持一致，深色）
          ///  设置了backgroundColor,状态栏颜色会依据此颜色的深浅变化
          backgroundColor: Colors.blue,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //     statusBarColor: Colors.transparent,
          //
          //     /// 设置 状态栏图标为深色
          //     statusBarIconBrightness: Brightness.dark),
          // brightness: Brightness.dark,
          leading: Container(),
          leadingWidth: 0,
          elevation: 0,
          titleSpacing: 10,
          title: JdeMainAppBar()),
      body: ListView.builder(
          itemBuilder: (context, index) {
            var model = mainDataList[index];
            // 头部佣金统计信息 + 跳转入口
            if (model is CommissionModel) {
              return CommissionCtrl(model: model);
            } else if (model is NewsModelList) {
              return NewsCtrl(model: model);
            } else if (model is TargetModel) {
              return TargetAchievementCtrl(model: model);
            }
          },
          itemCount: mainDataList.length),
    );
  }
}

class JdeMainAppBar extends StatefulWidget {
  const JdeMainAppBar({Key? key}) : super(key: key);

  @override
  State<JdeMainAppBar> createState() => _JdeMainAppBarState();
}

class _JdeMainAppBarState extends State<JdeMainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/country_default.png", width: 30, height: 30),
            SizedBox(width: 5),
            Text(
              "Head Office",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        // Text("data"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/ic_yellow.png", width: 15, height: 30),
            SizedBox(width: 5),
            Container(
              height: 25,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 150),
                      child: Text(
                        Characters("My department and sub-departmentssssssss")
                            .join('\u{200B}'),
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    SizedBox(width: 3),
                    Image.asset("images/ic_yellow.png", width: 15, height: 30),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

// String fixAutoLines() {
//   return Characters(this).join('\u{200B}');
// }
