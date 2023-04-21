// import 'package:flutter/material.dart';
//
// class PullToRefreshItem extends StatefulWidget {
//   const PullToRefreshItem({Key? key}) : super(key: key);
//
//   @override
//   State<PullToRefreshItem> createState() => _PullToRefreshItemState();
// }
//
// class _PullToRefreshItemState extends State<PullToRefreshItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//       // color: Colors.greenAccent,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(5)),
//       clipBehavior: Clip.antiAlias,
//       child: Container(
//         margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//         // 外层列组件
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 横向图片，名称
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: FadeInImage.assetNetwork(
//                           image: storeList[index].firstHeadImg,
//                           fit: BoxFit.cover,
//                           placeholder: 'images/ic_yellow.png',
//                           imageErrorBuilder: (context, error, stack) {
//                             return Image.asset('images/default.png');
//                           },
//                           // width: 50,
//                           // height: 50,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 50,
//                       margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                       child: Column(
//                         // 主轴方向
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         // 于主轴垂直的方向
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(storeList[index].buyerName),
//                           Text(
//                             "phone:" + storeList[index].contactTel,
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Container(
//                   width: 50,
//                   height: 20,
//                   // color: Colors.blueAccent,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(2)),
//                   child: Center(
//                       child: Text(
//                     "routed",
//                     style: TextStyle(color: Colors.white),
//                   )),
//                 )
//               ],
//             ),
//             // 占位
//             SizedBox(
//               height: 10,
//             ),
//             // 横向地址
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(storeList[index].provinceName),
//                 Text(
//                   storeList[index].distanceStr != null
//                       ? "Abount " + storeList[index].distanceStr! + " km"
//                       : "--",
//                   style: TextStyle(fontSize: 12, color: Colors.blue),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
