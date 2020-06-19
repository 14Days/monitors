import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';

import '../dioStore.dart';

class AlertServices {
  static Future<Response> fetchAlertList() async {
    Dio dio = DioStore.dio;
    Response response;
    try {
      response = await dio.get('/warning');
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        response = Response(data: {
          'status': 'error',
          'error': '服务器连接失败',
        });
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
    println(response);
    return response;
  }

}
