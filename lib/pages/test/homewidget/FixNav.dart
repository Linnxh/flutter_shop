import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/HomeDataModel.dart';

class FixNav extends StatefulWidget {
  final HomeSetting? arguments;

  const FixNav({this.arguments, Key? key}) : super(key: key);

  @override
  State<FixNav> createState() => _LayoutText2State();
}

class _LayoutText2State extends State<FixNav> {
  HomeSetting? arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arguments = widget.arguments;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SliverToBoxAdapter(child: Center(
  //       child: Text("FixNave===${arguments?.isShowSearch?.toString()}")
  //   ));
  // }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        Row(
          children: [
            ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: 50),
              child: Container(
                height: 5,
                decoration: BoxDecoration(color: Colors.redAccent),
              ),
            )
          ],
        )
      ],
    ));
  }
}

// class LayoutTest1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         //Flex的两个子widget按1：2来占据水平空间
//         Flex(
//           direction: Axis.horizontal,
//           children: <Widget>[
//             Expanded(
//               flex: 1,
//               child: Container(
//                 height: 30.0,
//                 color: Colors.red,
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 height: 30.0,
//                 color: Colors.green,
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 50.0),
//           child: Row(
//             children: <Widget>[
//               Text("AAAA" * 100,
//                   style: TextStyle(fontSize: 15, color: Colors.white)),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 50.0),
//           child: SizedBox(
//             height: 100.0,
//             //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
//             child: Flex(
//               direction: Axis.vertical,
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     height: 30.0,
//                     color: Colors.red,
//                     child: Text(
//                       "xxx" * 1000,
//                       style: TextStyle(fontSize: 15, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Spacer(
//                   flex: 1,
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     height: 30.0,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
