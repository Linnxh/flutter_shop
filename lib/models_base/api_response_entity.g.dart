import 'package:flutter_shop/models_base/api_response_entity.dart';

import 'MyJsonConvert.dart';

ApiResponseEntity<T> $ApiResponseEntityFromJson<T>(Map<String, dynamic> json) {
  MyJsonConvert myJson = MyJsonConvert();
  final ApiResponseEntity<T> apiResponseEntity = ApiResponseEntity<T>();
  final int? code = myJson.convert<int>(json['code']);
  if (code != null) {
    apiResponseEntity.code = code;
  }
  final String? message = myJson.convert<String>(json['msg']);
  if (message != null) {
    apiResponseEntity.msg = message;
  }
  final T? data = myJson.convert<T>(json['data']);
  if (data != null) {
    apiResponseEntity.data = data;
  }

  final bool? success = myJson.convert<bool>(json['success']);
  if (success != null) {
    apiResponseEntity.success = success;
  }
  final bool? notSuccess = myJson.convert<bool>(json['notSuccess']);
  if (notSuccess != null) {
    apiResponseEntity.notSuccess = notSuccess;
  }

  return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data;
  data['success'] = entity.success;
  data['notSuccess'] = entity.notSuccess;
  return data;
}
