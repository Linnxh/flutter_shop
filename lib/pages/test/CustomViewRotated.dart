import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TurnBox.dart';

class CustomViewRotated extends StatefulWidget {
  final Map? arguments;

  CustomViewRotated({this.arguments, Key? key}) : super(key: key);

  @override
  _CustomViewRotatedState createState() =>
      _CustomViewRotatedState(arguments: arguments);
}

class _CustomViewRotatedState extends State<CustomViewRotated> {
  final Map? arguments;

  _CustomViewRotatedState({this.arguments});

  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomViewRotated"),
      ),
      body: ListView(
        children: [
          Text(
              "CustomViewRotated ${arguments != null ? arguments!['id'] : '10000'}"),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TurnBox(
                turns: _turns,
                speed: 500,
                child: const Icon(
                  Icons.refresh,
                  size: 50,
                ),
              ),
              TurnBox(
                turns: _turns,
                speed: 1000,
                child: const Icon(
                  Icons.refresh,
                  size: 150.0,
                ),
              ),
              ElevatedButton(
                child: const Text("顺时针旋转1/5圈"),
                onPressed: () {
                  setState(() {
                    _turns += .2;
                  });
                },
              ),
              ElevatedButton(
                child: const Text("逆时针旋转1/5圈"),
                onPressed: () {
                  setState(() {
                    _turns -= .2;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
