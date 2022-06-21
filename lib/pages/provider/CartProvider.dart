import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/Storage.dart';

/// 购物车provider：存放购物车数据，选中状态
class CartProvider with ChangeNotifier {
  List _cartList = [];

  List get cartList => this._cartList;

  CartProvider() {
    init();
  }

  init() async {
    String? cartList = await Storage.getString('cartList');
    if (cartList != null) {
      List cartListData = json.decode(cartList);
      _cartList = cartListData;
    } else {
      _cartList = [];
    }
    notifyListeners();
  }

  updateCartList() {
    init();
  }
}
