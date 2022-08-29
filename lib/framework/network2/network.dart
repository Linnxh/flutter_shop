import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/main.dart';
import '../Global.dart';

/**
 * 参考：https://book.flutterchina.club/chapter15/network.html#_15-5-1-%E7%BD%91%E7%BB%9C%E6%8E%A5%E5%8F%A3%E7%BC%93%E5%AD%98
 */
class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class NetInterceptor extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // if (!Global.profile.cache!.enable) {
    //   return handler.next(options);
    // }
    // // refresh标记是否是"下拉刷新"
    // bool refresh = options.extra["refresh"] == true;
    // //如果是下拉刷新，先删除相关缓存
    // if (refresh) {
    //   if (options.extra["list"] == true) {
    //     //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
    //     cache.removeWhere((key, v) => key.contains(options.path));
    //   } else {
    //     // 如果不是列表，则只删除uri相同的缓存
    //     delete(options.uri.toString());
    //   }
    //   return handler.next(options);
    // }
    // if (options.extra["noCache"] != true &&
    //     options.method.toLowerCase() == 'get') {
    //   String key = options.extra["cacheKey"] ?? options.uri.toString();
    //   var ob = cache[key];
    //   if (ob != null) {
    //     //若缓存未过期，则返回缓存内容
    //     if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
    //         Global.profile.cache!.maxAge) {
    //       return handler.resolve(ob.response);
    //     } else {
    //       //若已过期则删除缓存，继续向服务器请求
    //       cache.remove(key);
    //     }
    //   }
    // }

    print("\n================== 请求数据 ==========================");
    print("url = ${options.uri.toString()}");
    print("headers = ${options.headers}");
    print("params = ${options.data}");

    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    // // 如果启用缓存，将返回结果保存到缓存
    // if (Global.profile.cache!.enable) {
    //   _saveCache(response);
    // }
    print("\n================== 响应数据 ==========================");
    print("code = ${response.statusCode}");
    print("data = ${response.data}");
    print("\n");
    handler.next(response);
    if (response.statusCode == 401) {
      /// 拦截跳转
      globalNavigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/TabLayout", (route) => false);
    }
    handler.next(response);
  }

  @override
  onError(DioError e, ErrorInterceptorHandler handler) async {
    print("\n================== 错误响应数据 ======================");
    print("type = ${e.type}");
    print("message = ${e.message}");
    print("\n");
    return handler.next(e);
  }

  // void onError(
  //     DioError err,
  //     ErrorInterceptorHandler handler,
  //     ) =>
  //     handler.next(err);
  _saveCache(Response object) {
    RequestOptions options = object.requestOptions;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == Global.profile.cache!.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(object);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}
