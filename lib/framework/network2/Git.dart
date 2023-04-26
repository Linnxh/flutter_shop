import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Global.dart';
export 'package:dio/dio.dart' show DioError;

class Git {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = Dio(BaseOptions(
      baseUrl: 'http://api.test.egatee.cn',
      headers: {
        "SYSTEM_TYPE": 1,
        "COUNTRY_CODE": "UG",
        "COUNTRY_ID": 1,
        "Accept-Language": "en-US,en",
      },
      contentType: "application/json"));

  static void init() {
    // 网络请求拦截器
    dio.interceptors.add(Global.netInterceptor);
    dio.options.headers["Authorization"] =
        "Bearer 7e44304d-ea63-4e02-ab65-b5ea863fce62";
    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return 'PROXY 172.16.0.8:8888';
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 测试类
  Future<Map<String, dynamic>> getTextData(map) async {
    var r =
        await dio.post("/api/salesman/visitDynamicLog/getVisitRank", data: map);
    return r.data;
  }

  Future<Map<String, dynamic>> getNewsList(map) async {
    var r = await dio.post("/api/admin/officialarticle/jdeNews", data: map);
    return r.data;
  }

  Future<Map<String, dynamic>> getStoreList(map) async {
    var r = await dio.post("/api/user/buyer/listBuyersByDistancePage",
        data: map, options: Options(extra: {"isShowErrorToast": 1}));

    /// 设置附加参数，不显示toast，回掉中自行处理
    return r.data;
  }

  Future<Map<String, dynamic>> getSalesmanSale(map) async {
    var r = await dio.post("/api/order/orderstatistics/simpleSalesmanSale",
        data: map);
    return r.data;
  }

  Future<Map<String, dynamic>> queryCategoryList(map) async {
    var r = await dio.post("/api/search/search/queryCategoryList",
        data: map,
        options: Options(
            // extra: {"isShowErrorToast": 1}
            ));

    /// 设置附加参数，不显示toast，回掉中自行处理
    return r.data;
  }
}
