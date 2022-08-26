import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/HomeDataModel.dart';

class FixNavSimple extends StatefulWidget {
  final HomeSetting? arguments;
  final List<HomeLinkAndUrlData>? homeLinkDataList;

  const FixNavSimple({this.arguments, this.homeLinkDataList, Key? key})
      : super(key: key);

  @override
  State<FixNavSimple> createState() => _LayoutText2State();
}

class _LayoutText2State extends State<FixNavSimple>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  HomeSetting? arguments;
  List<HomeLinkAndUrlData>? homeLinkDataList = [];
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arguments = widget.arguments;
    homeLinkDataList = widget.homeLinkDataList;

    _tabController = null;
    _tabController = TabController(
        initialIndex: 0,
        length: homeLinkDataList?.length ?? 0,
        vsync: this); // 直接传this

    print("---->${_tabController?.previousIndex}");

    if (_tabController?.indexIsChanging == true) {
      print("---->indexch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Stack(
                /// stack + positioned 实现在父布局中固定显示某个组件
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )),
                  Positioned(
                    child: Flex(
                      /// Flex + Expanded(父组件得是flex) 按比例分配
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Container(
                            margin: (arguments?.search?.rightIcon?.isShow == 1)
                                ? EdgeInsets.fromLTRB(10, 5, 0, 0)
                                : EdgeInsets.fromLTRB(10, 5, 10, 5),
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.home),
                                Icon(Icons.search),
                              ],
                            ),
                          ),
                        ),
                        (arguments?.search?.rightIcon?.isShow == 1)
                            ? (Expanded(
                                flex: 0,
                                child: Icon(Icons.search),
                              ))
                            : Expanded(
                                flex: 0,
                                child: Text(""),
                              )
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            /// 必须指定高度
            height: 50,
            color: Colors.greenAccent,
            alignment: Alignment.center,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: TabBar(
                    controller: _tabController,
                    tabs: homeLinkDataList?.map((e) {
                          return Text(e.text ?? "",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22));
                        }).toList() ??
                        [Text("no data")],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: homeLinkDataList?.isEmpty == true
                            ? []
                            : homeLinkDataList?.map((e) {
                                  return Text("第${e.text}页面");
                                }).toList() ??
                                [Text("no data")]))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// @override
// Widget build(BuildContext context) {
//   return SliverToBoxAdapter(
//     child: SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             child: TabBar(
//               controller: _tabController,
//               tabs: homeLinkDataList?.map((e) {
//                 return Text(e.text ?? "",
//                     style:
//                     TextStyle(color: Colors.black, fontSize: 22));
//               }).toList() ??
//                   [Text("no data")],
//             ),
//           ),
//           Expanded(
//               child: TabBarView(
//                   controller: _tabController,
//                   children: homeLinkDataList?.isEmpty == true
//                       ? []
//                       : homeLinkDataList?.map((e) {
//                     return Text("第${e.text}页面");
//                   }).toList() ??
//                       [Text("no data")]))
//         ],
//
//       ),
//     ),
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
//             child: SizedBox(
//
//                 /// 要想让宽高生效，外层需要指定容器
//                 width: double.infinity,
//                 height: 50.0,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: UnconstrainedBox(
//                     alignment: Alignment.centerLeft,
//
//                     /// 去除掉父容器的限制
//                     child: Container(
//                       height: 40,
//                       width: 100,
//                       decoration: BoxDecoration(color: Colors.greenAccent),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(Icons.home),
//                           Icon(Icons.search),
//                           // Container(
//                           //   width: 100,
//                           //   height: 40,
//                           //   color: Colors.blueAccent,
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )))
//       ],
//     );
//   }
// }
