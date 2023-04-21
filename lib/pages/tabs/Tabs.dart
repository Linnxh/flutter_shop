import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/tabs/Cart.dart';
import 'package:flutter_shop/pages/tabs/Category.dart';
import 'package:flutter_shop/pages/tabs/Home.dart';
import 'package:flutter_shop/pages/tabs/User.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pageList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage()
  ];
  final List<BottomNavigationBarItem> _bottomList = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的'),
  ];

  // 2.2 定义ctrl
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _pageController?.addListener(() {
      var pageIndex = _pageController?.page;
      setState(() {
        _currentIndex = pageIndex?.toInt() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('jdShop'),
      // ),
      /// 2023-04-21
      /// 方法一：IndexStack中管理的子页面在一开始就全部一次性加载出来，不管是否显示，通过index来确定到底显示哪一个页面 body使用IndexedStack
      // body: IndexedStack(index: _currentIndex, children: _pageList),
      /// 方法二：通过AutomaticKeepAliveClientMixin仅首次加载
      // 2.1.body 使用pageView
      // 2.2 分页页面 混入(with) AutomaticKeepAliveClientMixin
      body: PageView(controller: _pageController, children: _pageList),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // 2.3 设置ctrl
            _pageController?.jumpToPage(_currentIndex);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.redAccent,
        items: _bottomList,
      ),
    );
  }
}
