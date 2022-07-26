import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/Search.dart';
import 'package:flutter_shop/pages/tabs/Cart.dart';
import 'package:flutter_shop/pages/tabs/Tabs.dart';

import '../pages/SearchPage2.dart';
import '../pages/productContent/ProductContent.dart';
import '../pages/test/CustomViewRotated.dart';
import '../pages/test/custompaint/CustomPaintRoute.dart';
import '../pages/test/renderObject/CustomCheckboxTest.dart';

/// 路由设置onGenerateRoute
final routes = {
  '/': (context) => Tabs(),
  // 无参数
  '/search': (context) => SearchPage(),
  '/cart': (context) => CartPage(),
  // 有参数
  '/search2': (context, {arguments}) => SearchPage2(arguments: arguments),
  '/productContent': (context, {arguments}) =>
      ProductContentPage(arguments: arguments),
  '/customViewRotated': (context, {arguments}) =>
      CustomViewRotated(arguments: arguments),
  '/customPaint': (context, {arguments}) =>
      CustomPainRoute(arguments: arguments),
  '/customCheckBox': (context, {arguments}) =>
      CustomCheckboxTest(arguments: arguments)
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
