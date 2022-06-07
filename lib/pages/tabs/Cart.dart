import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart/CartItem.dart';
import 'package:flutter_shop/pages/services/ScreenAdaper.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("cart"),
          actions: <Widget>[
            IconButton(onPressed: null, icon: Icon(Icons.launch))
          ],
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[CartItem()],
            ),
            Positioned(
                bottom: 0,
                width: ScreenAdaper.getScreenWidth(),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.black12)),
                    color: Colors.white, // 有边框的清苦啊下，颜色不能写在外层容器
                  ),
                  height: 50.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (val) {},
                              activeColor: Colors.pink,
                            ),
                            Text("check all")
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: 100,
                            height: 50,
                            alignment: Alignment.center,
                            color: Colors.redAccent,
                            child: Text(
                              "submit",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
