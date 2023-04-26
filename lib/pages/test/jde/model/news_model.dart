class NewsModel {
  int? id;
  String? title;

  NewsModel(this.id, this.title);

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class NewsModelList {
  List<NewsModel> list;

  NewsModelList(  this.list);

  // NewsModelList.fromJson(Map<String, dynamic> json) {
  //   list = json["list"];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['list'] = list;
  //   return data;
  // }
}
