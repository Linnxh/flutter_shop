import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,

            /// 设置 状态栏图标为深色
            statusBarIconBrightness: Brightness.dark),
        // title: Text("User"),
      ),
      body: ListView(
        children: [
          InkWell(
            child: Container(
              height: 50,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: Text(
                "CustomView Rotated",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/customViewRotated',
                  arguments: {"id": "testhaha"});
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              color: Colors.yellowAccent,
              alignment: Alignment.center,
              child: Text(
                "CustomView Paint Canvas",
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/customPaint',
                  arguments: {"id": "testhaha"});
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Text(
                "CustomView checkbox",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/customCheckBox',
                  arguments: {"id": "testhaha"});
            },
          ),
          userItemView(context, "layout1", "/layout1"),
          userItemView(context, "homeView", "/homeView"),
          userItemView(context, "TabLayout", "/TabLayout"),
          userItemView(context, "PullToRefresh", "/PullToRefresh"),
          userItemView(context, "PullToRefreshCustom", "/PullToRefreshCustom"),
          userItemView(context, "jde-首页", "/jdeMainPage"),
          userItemView(context, "jde-task", "/taskListPage"),
          userItemView(context, "googleMap", "/googleMap"),
          userItemView(context, "googleLocation", "/location"),
        ],
      ),
    );
  }
}

Widget userItemView(BuildContext context, String title, String routeName) {
  var bgColorsList = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.purple,
    Colors.blueAccent,
    Colors.teal,
    Colors.deepOrangeAccent,
    Colors.lightGreen,
    Colors.blueGrey,
    Colors.pinkAccent,
    Colors.indigo,
  ];
  var nextInt = Random().nextInt(10);
  return InkWell(
    child: Container(
      height: 50,
      color: bgColorsList[nextInt],
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 15, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
  );
}
