import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/ProductContentModel.dart';

class CartNumProduct extends StatefulWidget {
  final ProductContentitem _productContent;

  const CartNumProduct(this._productContent, {Key? key}) : super(key: key);

  @override
  _CartNumProductState createState() => _CartNumProductState();
}

class _CartNumProductState extends State<CartNumProduct> {
  late ProductContentitem _productContent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._productContent = widget._productContent;
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
      onTap: () {
        setState(() {
          if (_productContent.count != null &&
              _productContent.count! > 1) {
            _productContent.count = (_productContent.count! - 1);
          }
        });
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
        setState(() {
          if (this._productContent.count != null) {
            this._productContent.count = (this._productContent.count! + 1);
          }
        });
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
      child: Text("${this._productContent.count}"),
    );
  }
}
