import 'package:dio/dio.dart';

final mockBaseUrl = 'http://121.199.68.141:3000/mock/35';
final realityBaseUrl = 'http://121.199.68.141:8082/';
//final baseUrl = 'http://www.maplelala.club:8080';

class DioStore{
  static Dio _dio;
  static Dio get dio {
    if (_dio == null) {
      _dio = Dio();
      _dio.options.baseUrl = mockBaseUrl;
      _dio.options.connectTimeout = 5000;
      _dio.options.receiveTimeout = 3000;
    }
    return _dio;
  }

  static Dio _dioR;
  static Dio get dioR {
    if (_dioR == null) {
      _dioR = Dio();
      _dioR.options.baseUrl = realityBaseUrl;
      _dioR.options.connectTimeout = 5000;
      _dioR.options.receiveTimeout = 3000;
    }
    return _dioR;
  }
}
