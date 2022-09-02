import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text("User"),
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
          InkWell(
            child: Container(
              height: 50,
              color: Colors.pinkAccent,
              alignment: Alignment.center,
              child: Text(
                "Layout1",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/layout1');
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text(
                "homeView",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/homeView');
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: Text(
                "TabLayout",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/TabLayout');
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Text(
                "PullToRefresh",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/PullToRefresh');
            },
          )
        ],
      ),
    );
  }
}
