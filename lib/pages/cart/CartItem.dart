import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart/CartNum.dart';
import 'package:flutter_shop/pages/services/ScreenAdaper.dart';
import 'package:provider/provider.dart';

import '../../model/ProductContentModel.dart';
import '../provider/CartProvider.dart';

class CartItem extends StatefulWidget {
  final Map _itemData;

  const CartItem(this._itemData, {Key? key}) : super(key: key);

  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late Map _itemData;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    /// 注意赋值的位置，cartProvider.cartList 变更 ===>>> cart里的数据重新渲染 ===>>>cartItem重新执行 build方法，initState不会重新执行
    _itemData = widget._itemData;
    var cartProvider = Provider.of<CartProvider>(context);
    return Container(
      height: 110,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: Checkbox(
              value: _itemData["checked"],
              onChanged: (val) {
                _itemData["checked"] = !_itemData["checked"];
                cartProvider.itemCheckChange();
              },
              activeColor: Colors.pink,
            ),
          ),
          Container(
            width: 60,
            child: Image.network("${_itemData["pic"]}", fit: BoxFit.cover),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${_itemData["title"]}", maxLines: 2),
                  Text("${_itemData["selectedAttr"]}", maxLines: 2),
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("￥${_itemData["price"]}",
                            style: TextStyle(color: Colors.red)),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CartNum(_itemData),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
