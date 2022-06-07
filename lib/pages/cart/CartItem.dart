import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart/CartNum.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              child: Checkbox(
                value: true,
                onChanged: (val) {},
                activeColor: Colors.pink,
              ),
            ),
            Container(
              width: 120,
              child: Image.network(
                  "https://www.itying.com/images/flutter/hot1.jpg",
                  fit: BoxFit.fill),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "titlddddddddddddde1",
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "12",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CartNum(),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
