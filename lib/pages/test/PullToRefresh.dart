import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/store_list.dart';
import 'package:flutter_shop/models_base/page_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../framework/network2/Git.dart';
import '../../models_base/api_response_entity.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({Key? key}) : super(key: key);

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  List<String> dataList = ["1", "2", "3", "4", "5", "6", "7", "8"];
  List<StoreList> storeList = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  Map<String, dynamic> map = Map();

  @override
  void initState() {
    super.initState();
    // Map<String, dynamic> map = Map();
    // map["dateType"] = 6;
    // Git(context).getTextData(map).then((value) {
    //   setState(() {
    //     // _test = value;
    //     ApiResponseEntity<List<VisitRanking>> resp =
    //         ApiResponseEntity.fromJson(value);
    //     print("===============resp==列表数据" + resp.toJson().toString());
    //   });
    // });
    //
    map["lat"] = 39.90754666666667;
    map["lng"] = 116.47089333333334;
    map["size"] = 8;
    map["current"] = 1;
    map["buyerSearchType"] = 1;

    // Git(context).getStoreList(map).then((value) {
    //   setState(() {
    //     ApiResponseEntity<PageModel<StoreList>> resp =
    //         ApiResponseEntity.fromJson(value);
    //     // storeList
    //     // var aa = resp.data?.records;
    //     // var title = aa?[0].title;
    //     // print("===========");
    //     // print(resp);
    //   });
    // });

    // Git(context).getSalesmanSale(map).then((value) {
    //   setState(() {
    //     /// 若要使用json解析，则所有的内部类都要使用实体封装，否则解析不出内部实体 lib/generated/json/base/json_convert_content.dart:95
    //     ApiResponseEntity<List<dynamic>> resp =
    //         ApiResponseEntity.fromJson(value);
    //     print("===============resp==title");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    void _onRefresh() async {
      // monitor network fetch
      // await Future.delayed(Duration(milliseconds: 1000));
      // // if failed,use refreshFailed()
      // _refreshController.refreshCompleted();
      map["current"] = 1;
      Git(context).getStoreList(map).then((value) {
        setState(() {
          ApiResponseEntity<PageModel<StoreList>> resp =
              ApiResponseEntity.fromJson(value);
          if (resp.data?.records != null) {
            storeList = (resp.data?.records)!;
          }
          _refreshController.refreshCompleted();
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
              (resp.data?.pages)! > map["current"]) {
            _refreshController.loadNoData();
          }
        });
      });
    }

    return Scaffold(
      body: SmartRefresher(
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
        child: ListView.builder(
          itemBuilder: (c, i) =>
              Card(child: Center(child: Text(storeList[i].buyerName))),
          itemExtent: 100.0,
          itemCount: storeList.length,
        ),
      ),
    );
    ;
  }
}
