import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/test/jde/model/commission.dart';

class CommissionCtrl extends StatefulWidget {
  final CommissionModel model;

  const CommissionCtrl({required this.model, Key? key}) : super(key: key);

  @override
  State<CommissionCtrl> createState() => _CommissionCtrlState();
}

class _CommissionCtrlState extends State<CommissionCtrl> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.only(left: 10),
          color: Colors.blue,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "My Balance",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset("images/ic_yellow.png",
                            width: 15, height: 15),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${widget.model.pendingSettlementAmount}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17))
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Commission",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset("images/ic_yellow.png",
                              width: 15, height: 15),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("${widget.model.balanceAccount}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17))
                    ],
                  ))
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTabItem("images/ic_yellow.png", "tab1"),
                  buildTabItem("images/ic_yellow.png", "tab2"),
                  buildTabItem("images/ic_yellow.png", "tab2"),
                  buildTabItem("images/ic_yellow.png", "tab2"),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Column buildTabItem(String imgPath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Image.asset("${imgPath}", width: 40, height: 40),
        SizedBox(
          height: 10,
        ),
        Text("${title}",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17))
      ],
    );
  }
}
