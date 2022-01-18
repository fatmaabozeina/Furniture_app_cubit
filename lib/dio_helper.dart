import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:lyans_creative_task/data_model.dart';

class DioHelper {
  static Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://eaa16a98-eedb-4982-8738-07af66e27d74.mock.pstmn.io/',
        receiveDataWhenStatusError: true));
  }

  Future<Furniture> getData(String path, Map<String, dynamic> query) async {
    var jsonData = await dio.get(path, queryParameters: query);
    var json = jsonDecode(jsonData.data);
    print(json is Map<String, dynamic>);
    var f = Furniture.fromJson(json);
    print("fatma ${f.a}");
    return f;
  }
}
