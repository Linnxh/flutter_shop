import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// lxh_tips:Flex + Expanded 组合使用
///
///

class LayoutTest1 extends StatefulWidget {
  const LayoutTest1({Key? key}) : super(key: key);

  @override
  State<LayoutTest1> createState() => _LayoutText2State();
}

class _LayoutText2State extends State<LayoutTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutTest1"),
      ),
      body: Column(
        children: <Widget>[
          //Flex的两个子widget按1：2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              children: <Widget>[
                Wrap(children: [
                  Text(
                    "aa" * 100,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Text(
              "aa" * 100,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                      // child: Text(
                      //   "xxx" * 1000,
                      //   style: TextStyle(fontSize: 15, color: Colors.black),
                      // ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
