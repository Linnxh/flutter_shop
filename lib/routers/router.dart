import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/Search.dart';
import 'package:flutter_shop/pages/tabs/Cart.dart';
import 'package:flutter_shop/pages/tabs/Tabs.dart';
import 'package:flutter_shop/pages/test/PullToRefreshCustom.dart';
import 'package:flutter_shop/pages/test/homewidget/FixNav.dart';
import 'package:flutter_shop/pages/test/jde/JdeMainPage.dart';
import 'package:flutter_shop/pages/test/jde/LocationPage.dart';
import 'package:flutter_shop/pages/test/jde/MapSample.dart';
import 'package:flutter_shop/pages/test/jde/TaskListPage.dart';

import '../pages/SearchPage2.dart';
import '../pages/productContent/ProductContent.dart';
import '../pages/test/CustomViewRotated.dart';
import '../pages/test/PullToRefresh.dart';
import '../pages/test/custompaint/CustomPaintRoute.dart';
import '../pages/test/custompaint/LayoutTest2.dart';
import '../pages/test/homewidget/FixNavSimple.dart';
import '../pages/test/homewidget/TabLayout.dart';
import '../pages/test/layout/LayoutTest1.dart';
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
      CustomCheckboxTest(arguments: arguments),
  '/layout1': (context) => LayoutTest1(),
  '/homeView': (context) => LayoutTest2(),
  '/fixnav': (context, {arguments}) => FixNav(arguments: arguments),
  '/fixnavsimple': (context, {arguments}) => FixNavSimple(arguments: arguments),
  '/TabLayout': (context, {arguments}) => TabLayout(arguments: arguments),
  '/PullToRefresh': (context, {arguments}) => PullToRefresh(),
  '/PullToRefreshCustom': (context, {arguments}) => PullToRefreshCustom(),
  '/jdeMainPage': (context, {arguments}) => JdeMainPage(),
  '/taskListPage': (context, {arguments}) => TaskListPage(),
  '/googleMap': (context, {arguments}) => MapSample(),
  '/location': (context, {arguments}) => LocationPage(),
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
