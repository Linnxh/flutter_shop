import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/CartProvider.dart';

class CartNum extends StatefulWidget {
  final Map _itemData;

  const CartNum(this._itemData, {Key? key}) : super(key: key);

  @override
  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  late Map _itemData;
  late CartProvider cartProvider;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _itemData = widget._itemData;
    cartProvider = Provider.of<CartProvider>(context);
    return Container(
      width: 82,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: [_leftBtn(), _centerBtn(), _rightBtn()],
      ),
    );
  }

  Widget _leftBtn() {
    return InkWell(
      onTap: () {
        /// 注意此处该值对应的是，调用cartNum的CartItem的_itemData 的值，对应列表页的值也会相应的变化，===>lib/pages/tabs/Cart.dart:34,会同步到carProvider里的数据中，
        /// 此时需要将变化以后的值，存到本地存储中
        if (_itemData["count"] > 1) {
          _itemData["count"]--;
          cartProvider.itemCountChange();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        child: Text("-"),
      ),
    );
  }

  Widget _rightBtn() {
    return InkWell(
      onTap: () {
        _itemData["count"]++;
        cartProvider.itemCountChange();
      },
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        child: Text("+"),
      ),
    );
  }

  Widget _centerBtn() {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 20,
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(width: 1, color: Colors.black12),
              right: BorderSide(width: 1, color: Colors.black12))),
      child: Text("${_itemData["count"]}"),
    );
  }
}
