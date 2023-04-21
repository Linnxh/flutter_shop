import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart/CartItem.dart';
import 'package:flutter_shop/pages/provider/CartProvider.dart';
import 'package:flutter_shop/pages/services/ScreenAdaper.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var isEdit = false;

  @override
  Widget build(BuildContext context) {
    print("===");
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("cart"),
          actions: <Widget>[
            /// https://book.flutterchina.club/chapter4/constraints.html#_4-2-6-unconstrainedbox
            /// lxh_tops：appBar中指定了actions按钮的约束条件，通过改元素去除掉父元素的限制，
            /// 注意：UnconstrainedBox 虽然在其子组件布局时可以取消约束（子组件可以为无限大），但是 UnconstrainedBox 自身是受其父组件约束的，所以当 UnconstrainedBox 随着其子组件变大后，如果UnconstrainedBox 的大小超过它父组件约束时，也会导致溢出报错
            UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isEdit = !isEdit;
                  });
                },
                icon: Icon(Icons.launch))
          ],
        ),
        body: cartProvider.cartList.length > 0
            ? Stack(
                children: <Widget>[
                  ListView(
                    children: [
                      Column(
                        children: cartProvider.cartList.map((value) {
                          return CartItem(value);
                        }).toList(),
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
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
                                  // Checkbox(
                                  //   value: cartProvider.isCheckedAll,
                                  //   onChanged: (val) {
                                  //     cartProvider.checkAll(val);
                                  //   },
                                  //   activeColor: Colors.pink,
                                  // ),
                                  // Text("checkAll",
                                  //     style: TextStyle(
                                  //         color: Colors.red, fontSize: 17)),
                                  // SizedBox(width: 5),
                                  Text("colorsssss",
                                      style: TextStyle(
                                          color: isEdit == false
                                              ? Colors.yellowAccent
                                              : Colors.blueAccent)),
                                  isEdit == false
                                      ? Text("sumPrice", style: TextStyle())
                                      : Text(""),
                                  SizedBox(width: 5),
                                  isEdit == false
                                      ? Text(
                                          "${cartProvider.allPrice}",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 17),
                                        )
                                      : Text(""),
                                ],
                              ),
                            ),
                            isEdit == false
                                ? Align(
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
                                : Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      /// container text 可以设置inkwell设置监听事件
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        alignment: Alignment.center,
                                        color: Colors.redAccent,
                                        child: Text(
                                          "del",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      onTap: () {
                                        cartProvider.removeItem();
                                      },
                                    ),
                                  )
                          ],
                        ),
                      ))
                ],
              )
            : Center(
                child: Text("no data in cate"),
              ));
  }
}
