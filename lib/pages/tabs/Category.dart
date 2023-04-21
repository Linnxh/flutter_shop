import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product/category.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../framework/network2/Git.dart';
import '../../models_base/api_response_entity.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  bool isExpand = false;
  List<Category> list = [];
  String selectId = "";

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> map = Map();
    map["firstCategoryBackId"] = null;
    map["sellerId"] = null;
    Git(context).queryCategoryList(map).then((value) {
      setState(() {
        ApiResponseEntity<List<Category>> resp =
            ApiResponseEntity.fromJson(value);
        setState(() {
          if (resp.data != null) {
            list = resp.data!;
            selectId = list[0].id!;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ///  保持页面状态，仅在首次加载
    /// 混入 时 AutomaticKeepAliveClientMixin 必须调用
    super.build(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[],
          elevation: 0,
          titleSpacing: 10,
          // 标题左右两边的距离
          title: SearchAppBar(
            // 方法一：title本身是一个widget，自定义即可
            // 方法二：继承PreferredSizeWidget，未实现
            hintLabel: "test/hah",
          ),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "点击头部",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER);
                          setState(() {
                            list![index].isExpand = !list![index].isExpand;
                          });
                        },
                        child: Container(
                          color: Color(0xffF5F6F8),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: FadeInImage.assetNetwork(
                                    image: list![index].icon == null
                                        ? ""
                                        : list![index].icon!,
                                    fit: BoxFit.cover,
                                    placeholder: 'images/ic_yellow.png',
                                    imageErrorBuilder: (context, error, stack) {
                                      return Image.asset('images/default.png');
                                    },
                                    // width: 50,
                                    // height: 50,
                                  ),
                                ),
                              ),
                              Container(
                                  // 多行文字
                                  alignment: Alignment.center,
                                  height: 50,
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text(
                                    list![index].name! + index.toString(),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Container(
                                color: Colors.white,
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index2) {
                          return Container(
                            alignment: Alignment.center,
                            color: Colors.grey,
                            height: 40,
                            child: Text(
                                list![index].childCategoryList![index2].name! +
                                    index2.toString()),
                          );
                        },
                        itemCount: list == null
                            ? 0
                            : (list![index].isExpand
                                ? list![index].childCategoryList!.length
                                : 0),
                        // todo 判空
                        // isExpand ? 2 : 0,
                      ),
                    ],
                  );
                },
                itemCount: list == null ? 0 : list!.length,
              ),
            ),
            Expanded(
                flex: 3,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Text("test");
                  },
                  itemCount: 15,
                ))
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

/// 方法一：title本身是一个widget，自定义即可
class SearchAppBar extends StatefulWidget {
  SearchAppBar({Key? key, required this.hintLabel}) : super(key: key);

  final String hintLabel;

  @override
  State<StatefulWidget> createState() {
    return SearchAppBarState();
  }
}

class SearchAppBarState extends State<SearchAppBar> {
  late FocusNode _focusNode;

  ///默认不展示控件

  bool _offstage = true;

  ///监听TextField内容变化
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController.addListener(() {
      var isVisible = _textEditingController.text.isNotEmpty;
      _updateDelIconVisible(isVisible);
    });
  }

  _updateDelIconVisible(bool isVisible) {
    setState(() {
      _offstage = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.redAccent,
              height: double.infinity,
              // margin: const EdgeInsets.only(left: 0),
              decoration: BoxDecoration(
                  color: Color(0xffF5F6F8),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  // paddingOnly(const EdgeInsets.only(left: 8)),
                  Icon(
                    Icons.search,
                    color: Color(0xff958C8D),
                  ),
                  // paddingOnly(const EdgeInsets.only(left: 8)),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      /// 文本框
                      controller: _textEditingController,
                      autofocus: false,
                      cursorColor: Colors.grey,
                      cursorHeight: 20,
                      focusNode: _focusNode,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                          hintText: widget.hintLabel,
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                          counterText: '',

                          /// 以下设置为了让textfield占满父组件的高度且内容居中
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(top: 0, bottom: 0)),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Offstage(
                    offstage: _offstage,
                    child: GestureDetector(
                      onTap: () => {_textEditingController.clear()},
                      child: Icon(
                        Icons.delete_forever,
                        color: Color(0xff958C8D),
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _focusNode.unfocus();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text("取消",
                  style: TextStyle(fontSize: 13, color: Color(0xFF3D7DFF))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }
}
