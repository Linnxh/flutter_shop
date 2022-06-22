import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/Storage.dart';

/// 购物车provider：存放购物车数据，选中状态
class CartProvider with ChangeNotifier {
  List _cartList = [];
  bool _isCheckAll = false;
  double _allPrice = 0;

  List get cartList => _cartList;

  bool get isCheckedAll => _isCheckAll;

  double get allPrice => _allPrice;

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
    _isCheckAll = isCheckAll();
    notifyListeners();
  }

  updateCartList() {
    init();
  }

  itemCountChange() {
    Storage.setString("cartList", json.encode(_cartList));
    computeAllPrice();
    notifyListeners();
  }

  itemCheckChange() {
    if (isCheckAll()) {
      _isCheckAll = true;
    } else {
      _isCheckAll = false;
    }
    Storage.setString("cartList", json.encode(_cartList));
    computeAllPrice();
    notifyListeners();
  }

  checkAll(value) {
    for (var i = 0; i < _cartList.length; i++) {
      _cartList[i]["checked"] = value;
    }
    Storage.setString("cartList", json.encode(_cartList));
    computeAllPrice();
    notifyListeners();
    _isCheckAll = value;
  }

  bool isCheckAll() {
    if (_cartList.length > 0) {
      for (var i = 0; i < _cartList.length; i++) {
        if (_cartList[i]["checked"] == false) {
          return false;
        }
      }
      return true;
    }

    return false;
  }

  computeAllPrice() {
    double tempAllPrice = 0;
    for (var i = 0; i < _cartList.length; i++) {
      if (_cartList[i]["checked"] == true) {
        tempAllPrice += _cartList[i]["price"] * _cartList[i]["count"];
      }
    }
    _allPrice = tempAllPrice;
    notifyListeners();
  }

  removeItem() {
    _cartList.removeWhere((element) => element["checked"] == true);
    Storage.setString("cartList", json.encode(_cartList));

    notifyListeners();
  }
}
