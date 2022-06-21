import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartNum extends StatefulWidget {
  final Map _itemData;

  const CartNum(this._itemData, {Key? key}) : super(key: key);

  @override
  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  late Map _itemData;

  @override
  void initState() {
    super.initState();
    _itemData = widget._itemData;
  }

  @override
  Widget build(BuildContext context) {
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
      onTap: () {},
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
      onTap: () {},
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
