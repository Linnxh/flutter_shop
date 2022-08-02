import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/HomeDataModel.dart';

class TabLayout extends StatefulWidget {
  final HomeSetting? arguments;
  final List<HomeLinkAndUrlData>? homeLinkDataList;

  const TabLayout({this.arguments, this.homeLinkDataList, Key? key})
      : super(key: key);

  @override
  State<TabLayout> createState() => _LayoutText2State();
}

List _spList = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13"
];

class _LayoutText2State extends State<TabLayout>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  HomeSetting? arguments;
  List<HomeLinkAndUrlData>? homeLinkDataList;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    arguments = widget.arguments;
    homeLinkDataList = widget.homeLinkDataList;

    _tabController = null;
    _tabController = TabController(
        initialIndex: 0, length: _spList.length ?? 0, vsync: this); // 直接传this

    print("---->${_tabController?.previousIndex}");

    if (_tabController?.indexIsChanging == true) {
      print("---->indexch");
    }
  }

  /// 带有appBar的tabLayout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              tabs: _spList.map((e) {
                return Text(e,
                    style: TextStyle(color: Colors.black, fontSize: 22));
              }).toList(),
            ),
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: _spList.isEmpty
                      ? []
                      : _spList.map((e) {
                          return Text("第$e页面");
                        }).toList()))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  /// 带有appBar的tabLayout
// @override
// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 3,
//     child: Scaffold(
//       appBar: AppBar(
//         bottom: TabBar(
//             indicatorColor: Colors.red,
//             indicatorSize: TabBarIndicatorSize.label,
//             tabs: [Text("1"), Text("2"), Text("3")]),
//       ),
//       body: TabBarView(
//         children: [Text("1111111111"), Text("222"), Text("3333")],
//       ),
//     ),
//   );
// }
}
