import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';

import '../dioStore.dart';

class DeviceServices {
  static Future<Response> fetchDeviceList() async {
    Dio dio = DioStore.dioR;
    Response response;
    try {
      response = await dio.get('/device');
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

  static Future<Response> fetchDeviceDetail(int id) async {
    Dio dio = DioStore.dio;
    Response response;
    try {
      response = await dio.get('/device/' + id.toString());
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
    println('detail');
    println(response);
    return response;
  }

  static Future<Response> addDevice(int id) async {
    Dio dio = DioStore.dioR;
    Response response;
    try {
      response = await dio.put('/device/' + id.toString());
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

  static Future<Response> deleteDevice(int id) async {
    Dio dio = DioStore.dioR;
    Response response;
    try {
      response = await dio.delete('/device/' + id.toString());
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

  static Future<Response> fetchMessage(String topic) async {
    Dio dio = DioStore.dioR;
    Response response;
    try {
      response = await dio.get('/msg/', queryParameters: {
        'topic': topic,
        'user_id': 1,
      });
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
