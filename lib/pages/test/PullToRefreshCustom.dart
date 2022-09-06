import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/store_list.dart';
import 'package:flutter_shop/models_base/page_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../framework/network2/Git.dart';
import '../../models_base/api_response_entity.dart';

class PullToRefreshCustom extends StatefulWidget {
  const PullToRefreshCustom({Key? key}) : super(key: key);

  @override
  State<PullToRefreshCustom> createState() => _PullToRefreshStateCustom();
}

class _PullToRefreshStateCustom extends State<PullToRefreshCustom> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  List<String> dataList = ["1", "2", "3", "4", "5", "6", "7", "8"];
  List<StoreList> storeList = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  Map<String, dynamic> map = Map();

  @override
  void initState() {
    super.initState();
    map["lat"] = 39.90754666666667;
    map["lng"] = 116.47089333333334;
    map["size"] = 16;
    map["current"] = 1;
    map["buyerSearchType"] = 1;
  }

  @override
  Widget build(BuildContext context) {
    void _onRefresh() async {
      map["current"] = 1;
      Git(context).getStoreList(map).then((value) {
        setState(() {
          ApiResponseEntity<PageModel<StoreList>> resp =
              ApiResponseEntity.fromJson(value);
          if (resp.data?.records != null) {
            storeList = (resp.data?.records)!;
          }
          _refreshController.refreshCompleted();
          if (resp.data?.pages == map["current"] ||
              map["current"] > (resp.data?.pages)!) {
            _refreshController.loadNoData();
          } else {
            _refreshController.resetNoData();
          }
        });
      });
    }

    _onLoading() async {
      map["current"] = (map["current"]) + 1;
      Git(context).getStoreList(map).then((value) {
        setState(() {
          ApiResponseEntity<PageModel<StoreList>> resp =
              ApiResponseEntity.fromJson(value);

          if (resp.data?.records != null) {
            storeList.addAll((resp.data?.records)!);
            _refreshController.loadComplete();
          }
          _refreshController.loadComplete();
          if (resp.data?.pages == map["current"] ||
              map["current"] > (resp.data?.pages)!) {
            _refreshController.loadNoData();
          }
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("pulltorefresh"),
      ),
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Container(
            margin:EdgeInsets.fromLTRB(0, 0, 0, 50) ,
            child: SmartRefresher(

              enablePullDown: true,

              enablePullUp: true,
              header: MaterialClassicHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text("上拉加载");
                  } else if (mode == LoadStatus.loading) {
                    body = CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("加载失败！点击重试！");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("松手,加载更多!");
                  } else {
                    body = Text("没有更多数据了!");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: CustomScrollView(
                /// 提供公用的Scrollable和viewport 组合多个sliver，常用举例：SliverList,SliverToBoxAdapter
                slivers: <Widget>[
                  // SliverAppBar(
                  //   title: Text("自定义列表"),
                  //   pinned: true,
                  //   // lxh 将appbar置顶 遗留问题：指示器位置不是很好
                  // ),
                  const SliverToBoxAdapter(
                    child: Text("=========listView 增加的头部============"),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              // color: Colors.greenAccent,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                // 外层列组件
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 横向图片，名称
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: FadeInImage.assetNetwork(
                                                  image: storeList[index]
                                                      .firstHeadImg,
                                                  fit: BoxFit.cover,
                                                  placeholder:
                                                      'images/ic_yellow.png',
                                                  imageErrorBuilder:
                                                      (context, error, stack) {
                                                    return Image.asset(
                                                        'images/default.png');
                                                  },
                                                  // width: 50,
                                                  // height: 50,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Column(
                                                // 主轴方向
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                // 于主轴垂直的方向
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      storeList[index].buyerName),
                                                  Text(
                                                    "phone:" +
                                                        storeList[index]
                                                            .contactTel,
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 50,
                                          height: 20,
                                          // color: Colors.blueAccent,
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Center(
                                              child: Text(
                                            "routed",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                        )
                                      ],
                                    ),
                                    // 占位
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // 横向地址
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(storeList[index].provinceName),
                                        Text(
                                          storeList[index].distanceStr != null
                                              ? "Abount " +
                                                  storeList[index].distanceStr! +
                                                  " km"
                                              : "--",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        childCount: storeList.length),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.redAccent,
                child: Center(child: Text("===submit==")),
                height: 50,
                width: double.infinity,
              )),
        ],
      ),
    );
  }
}
