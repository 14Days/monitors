import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';

import '../dioStore.dart';

class SubscribeServices {
  static Future<Response> fetchSubscribeList() async {
    Dio dio = DioStore.dioR;
    Response response;
    try {
      response = await dio.get('/device/subscribe');
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
    println('订阅');
    println(response);
    return response;
  }

}
