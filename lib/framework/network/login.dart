import 'dart:convert';

import 'dio_request.dart';

class LoginService {
  /// 获取用户数据中心列表
  static Future<List> getDataCenter() async {
    var response =
        await DioRequest.getInstance().dio.get('api/plist?is_hot=1');
    var data = jsonDecode(response.toString());
    return data;
  }

  /// 登录接口
  static login(value) async {
    var response = await DioRequest.getInstance()
        .dio
        .post('/sys/login', queryParameters: value)
    ;
    var data = jsonDecode(response.toString());

    /// 对返回的身份凭证全局持久化存储
    return data['key'];
  }

  /// 获取权限列表
  static menuNav() async {
    var response = await DioRequest.getInstance().dio.get('/sys/ddddmenu/nav');
    var data = jsonDecode(response.toString());
    return data['key'];
  }
}
