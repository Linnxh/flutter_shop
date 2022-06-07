import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage2 extends StatefulWidget {
  final Map? arguments;

  SearchPage2({this.arguments, Key? key}) : super(key: key);

  @override
  _SearchPage2State createState() => _SearchPage2State(arguments: arguments);
}

class _SearchPage2State extends State<SearchPage2> {
  final Map? arguments;

  _SearchPage2State({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search titile2"),
      ),
      body: Text(
          "searchContent2 ${arguments != null ? arguments!['id'] : '10000'}"),
    );
  }
}
