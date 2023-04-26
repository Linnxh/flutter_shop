import 'package:flutter/material.dart';
import 'package:flutter_shop/framework/my_color.dart';
import 'package:flutter_shop/pages/test/jde/model/news_model.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_shop/framework/extension/string_extension.dart';

class NewsCtrl extends StatefulWidget {
  final NewsModelList model;

  const NewsCtrl({required this.model, Key? key}) : super(key: key);

  @override
  State<NewsCtrl> createState() => _NewsCtrlState();
}

class _NewsCtrlState extends State<NewsCtrl> {
  @override
  Widget build(BuildContext context) {
    // String? showText = widget.model.list[index].title;
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 10),
      child: Swiper(
          autoplay: true,
          scrollDirection: Axis.vertical,
          autoplayDelay: 2000,
          itemBuilder: (BuildContext ctx, int index) {
            String? showText = widget.model.list[index].title;
            // var a = showText?.fixAutoLines();
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: MyColor.C_dfebff,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "News",
                        style: TextStyle(fontSize: 11, color: MyColor.C_e50039),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                        color: MyColor.C_e50039,
                      )),
                      padding:
                          EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${showText?.fixAutoLines()}",
                              style: TextStyle(
                                  fontSize: 11, color: MyColor.mainColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset("images/ic_yellow.png",
                              width: 20, height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: widget.model.list.length),
    );
  }
}
