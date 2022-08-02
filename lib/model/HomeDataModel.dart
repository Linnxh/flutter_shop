import 'dart:ffi';

class HomeDataModel {
  List<HomeItemModel> items = [];
  int? id;
  Page? page;

  HomeDataModel({required this.items, this.id});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new HomeItemModel.fromJson(v));
      });
    }
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['page'] != null) {
      var data = json['page'];
      page = new Page.fromJson(data);
    }
  }
}

class HomeItemModel {
  String? name;
  String? type;
  HomeSetting? setting;
  List<HomeLinkAndUrlData>? data = []; // 头部固定导航tab
  HomeItemModel({this.name, this.type, this.setting});

  HomeItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    var set = json['setting'];

    setting = new HomeSetting.fromJson(set);
    if (json["data"] != null) {
      json["data"].forEach((v) {
        if (v != null) {
          data?.add(new HomeLinkAndUrlData.fromJson(v));
        }
      });
    }
  }
}

class Page {
  String? pageName; //String? 表示可空类型
  String? titleBarTextColor;

  Page({this.pageName, this.titleBarTextColor});

  Page.fromJson(Map<String, dynamic> json) {
    pageName = json['pageName'];
    titleBarTextColor = json['titleBarTextColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageName'] = this.pageName;
    data['titleBarTextColor'] = this.titleBarTextColor;
    return data;
  }
}

class HomeSetting {
  // 固定导航组件 标签页组件
  String? textColor;
  int isShowSearch = 0;
  Search? search;

  // 公告组件
  String? text;

  HomeSetting();

  HomeSetting.fromJson(Map<String, dynamic> json) {
    textColor = json['textColor'];
    isShowSearch = json['isShowSearch'];
    search = Search.fromJson(json['search']);
    text = json['text'];
  }
}

class Search {
  String? placeholder;
  RightIcon? rightIcon;

  // Search({this.textColor, this.isShowSearch});

  Search.fromJson(Map<String, dynamic> json) {
    placeholder = json['placeholder'];
    rightIcon = RightIcon.fromJson(json["rightIcon"]);
  }
}

class RightIcon {
  int isShow = 0;
  String? url;
  String? link;

  // Search({this.textColor, this.isShowSearch});

  RightIcon.fromJson(Map<String, dynamic> json) {
    isShow = json['isShow'];
    url = json['url'];
    link = json['link'];
  }
}

class HomeLinkAndUrlData {
  String? url;

  String? link;
  String? text;
  String? type; // 商家端固定导航用于判断是否显示秒杀列表 type = "flash"

  HomeLinkAndUrlData.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    link = json['link'];
    text = json['text'];
    type = json['type'];
  }
}
