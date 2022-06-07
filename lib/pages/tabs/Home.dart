import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/services/ScreenAdaper.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../config/Config.dart';
import '../../model/FocusModel.dart';
import '../../model/ProductModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _focusData = [];
  List _hotProductList = [];
  List _bestProductList = [];

  @override
  void initState() {
    super.initState();
    _getFocusData();
    _getHotProductData();
    _getBestProductData();
  }

  //获取轮播图数据
  _getFocusData() async {
    var api = '${Config.domain}api/focus';
    var result = await Dio().get(api);
    var focusList = FocusModel.fromJson(result.data);
    setState(() {
      this._focusData = focusList.result;
    });
  }

  //获取猜你喜欢的数据
  _getHotProductData() async {
    var api = '${Config.domain}api/plist?is_hot=1';
    var result = await Dio().get(api);
    var hotProductList = ProductModel.fromJson(result.data);
    setState(() {
      this._hotProductList = hotProductList.result;
    });
  }

  //获取热门推荐的数据
  _getBestProductData() async {
    var api = '${Config.domain}api/plist?is_best=1';
    var result = await Dio().get(api);
    var bestProductList = ProductModel.fromJson(result.data);
    setState(() {
      this._bestProductList = bestProductList.result;
    });
  }

  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];

    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                imgList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            itemCount: imgList.length,
            pagination: new SwiperPagination(),
            autoplay: true),
      ),
    );
  }

  Widget _titleWidget(value) {
    return Container(
      height: ScreenAdaper.height(34),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), top: ScreenAdaper.width(20)),
      padding: EdgeInsets.only(left: ScreenAdaper.width(20)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.red,
        width: ScreenAdaper.width(10),
      ))),
      child: Row(
        // 横向的文件
        children: [
          Text(
            value,
            style: TextStyle(
                color: Colors.black54, fontSize: ScreenAdaper.size(24)),
          )
        ],
      ),
    );
  }

  //热门商品

  Widget _hotProductListWidget() {
    return Container(
      color: Colors.redAccent,

      /// lxh_tips: 指定高度，100（图片） + 30（索引）  + 20 （ 上下的距离padding，通过 指定内部的MainAxisAlignment.center）
      height: 160,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return Container(
            // padding: EdgeInsets.all(20),
            child: Column(
              /// 嵌套Column，将布局位置居于组件的中间
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: (100),
                  width: (100),
                  margin: EdgeInsets.only(right: (10)),
                  child: Image.network(
                      "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                      fit: BoxFit.cover),
                ),
                Container(
                  color: Colors.greenAccent,
                  height: (30),
                  // child: Text("第${index}条"),
                  /// 嵌套Column，将布局位置居于组件的底部
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("第${index}条"),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }

  Widget _hotProductListWidget2() {
    return Container(
      // color: Colors.redAccent,
      height: (190.0),
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return Column(
            children: <Widget>[
              Container(
                height: (100),
                width: (100),
                // margin: EdgeInsets.only(right: (21)),
                child: Image.network(
                    "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                    fit: BoxFit.cover),
              ),
              Container(
                // color: Colors.greenAccent,
                // padding: EdgeInsets.only(top: (10)),
                height: (50),
                child: Text("第${index}条"),
              )
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }

  //推荐商品 - 定死数据
  _recProductListItemWidget2() {
    var itemWidth = (ScreenAdaper.getScreenWidth() - 30) / 2;
    return Container(
      padding: EdgeInsets.all(5),
      width: itemWidth,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black12, width: 1)),
      child: Column(
        children: [
          Container(
              child: AspectRatio(
            // 防止服务器返回的高度不一样，
            aspectRatio: 1 / 1,
            child: Image.network(
                "https://image.meipinshu.com/resources/2022/3/31/1648711991380.jpg"),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "sdfskdfjsldkfjsdklfjkdsf是打开附件是打开了房间开始对接发克里斯丁开始对接付款",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "￥12.29",
                  style: TextStyle(color: Colors.redAccent),
                ),
                Text(
                  "￥12.29",
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),

            /// stack + align/positioned 实现页面的定位布局
            /// stack 里的 alignment 参考值：topLeft (-1,-1)右上角，针对组内所有组件，无法单独对子view进行调整
            /// align 控制的是组件在父组件的位置 可以Alignment.topLeft 也可以使用坐标Alignment(0,0)。
            /// positioned 同上，top:子元素距离顶部的距离（10）， bottom:子元素距离底部的距离
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "￥12.29",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "￥12.29",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //推荐商品 - 服务器数据
  _recProductListItemWidget3() {
    var itemWidth = (ScreenAdaper.getScreenWidth() - 30) / 2;
    return Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: _bestProductList.map((value) {
            //图片
            String sPic = value.sPic;
            sPic = Config.domain + sPic.replaceAll('\\', '/');

            return Container(
              padding: EdgeInsets.all(5),
              width: itemWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)),
              child: Column(
                children: [
                  Container(
                      child: AspectRatio(
                    // 防止服务器返回的高度不一样，
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      sPic,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "${value.title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "￥${value.price}",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        Text(
                          "￥${value.oldPrice}",
                          style: TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.lineThrough),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),

                    /// stack + align/positioned 实现页面的定位布局
                    /// stack 里的 alignment 参考值：topLeft (-1,-1)右上角，针对组内所有组件，无法单独对子view进行调整
                    /// align 控制的是组件在父组件的位置 可以Alignment.topLeft 也可以使用坐标Alignment(0,0)。
                    /// positioned 同上，top:子元素距离顶部的距离（10）， bottom:子元素距离底部的距离
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "￥12.29",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "￥12.29",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: ListView(
        children: <Widget>[
          _swiperWidget(),
          _titleWidget("猜你喜欢"),
          SizedBox(height: ScreenAdaper.height(12)),
          _hotProductListWidget(),
          // SizedBox(height: ScreenAdaper.height(12)),
          _titleWidget("热门推荐"),
          _recProductListItemWidget3()
        ],
      ),
    );
  }
}
