import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:observer/models/info.dart';

import '../dioStore.dart';

class UserServices {
  static Future<Response> fetchInfo() async {
    Dio dio = DioStore.dio;
    Response response;
    try {
      response = await dio.get('/api-user/user');
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
    println(response);
    return response;
  }

  static Future<Response> putInfo(Info info) async {
    Dio dio = DioStore.dioR;
    final data = {
      'height': info.height,
      'weight': info.weight,
      'sex': info.sex == SexType.man ? 'man' : 'woman',
      'birth': info.birthday.toIso8601String(),
    };
    Response response;
    try {
      response = await dio.put('/user', data: data);
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        response = Response(data: {
          'status': 'error',
          'error': '服务器连接失败',
        });
        print(e.request);
        print(e.message);
      }
    }
    println(response);
    return response;
  }

}
