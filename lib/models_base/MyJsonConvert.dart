import 'package:flutter_shop/models_base/page_model.dart';

import '../generated/json/base/json_convert_content.dart';
import '../models/news.dart';
import '../models/store_list.dart';

/// 参考链接
/// https://juejin.cn/post/7043721908801503269
/// 插件地址
/// https://github.com/fluttercandies/FlutterJsonBeanFactory
///
/// 自定义解析
class MyJsonConvert extends JsonConvert {
  T? asT<T extends Object?>(dynamic value) {
    try {
      String type = T.toString();
      if (type == "List<Category>") {
        return JsonConvert.fromJsonAsT<T>(value);
      }
      if (type == "List<VisitRanking>") {
        return JsonConvert.fromJsonAsT<T>(value);
      } else if (type == "PageModel<News>") {
        return PageModel<News>.fromJson(value) as T;
      } else if (type == "PageModel<StoreList>") {
        return PageModel<StoreList>.fromJson(value) as T;
      }
      // else if (type.startsWith("List<")) {
      //   return JsonConvert.fromJsonAsT<T>(value);
      // }

      else {
        return super.asT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  }
}
