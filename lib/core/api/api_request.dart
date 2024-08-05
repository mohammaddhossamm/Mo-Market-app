import 'package:dio/dio.dart';

class ApiRequest {
  final Dio _dio;
  ApiRequest(this._dio);

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
    required String lang ,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    var response = await _dio.post(
      endPoint,
      data: data,
    );
    return response;
  }

  Future<Response> getData({
    required String endPoint,
    required String lang,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    var response = await _dio.get(
      endPoint,
      queryParameters: query,
    );
    return response;
  }

  Future<Response> putData({
    required String endPoint,
    required Map<String, dynamic> data,
    required String lang ,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    var response = await _dio.put(
      endPoint,
      data: data,
    );
    return response;
  }
}
