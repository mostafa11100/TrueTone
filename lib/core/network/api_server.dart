import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "http://truetoneapi.runasp.net/api/Auth/";
  final Dio _dio;
  String? _token; 

  ApiService(this._dio);

  setToken(String token) {
    _token = token;
  }

  Map<String, String> _getHeaders() {
    if (_token != null) {
      return {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json; charset=utf-8',
      };
    } else {            
      return {
        'Content-Type': 'application/json; charset=utf-8',
      };
    }
  }

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await _dio.get(
        "$_baseUrl$endpoint",
        queryParameters: queryParameters,
        options: Options(headers: _getHeaders()),
      );
      return response.data;
    } on DioException catch (e) {
      print("Error in GET request: ${e.response?.data}");
      throw e;
    }
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      var response = await _dio.put(
        "$_baseUrl$endpoint",
        data: data,
        options: Options(headers: _getHeaders()),
      );
      return response.data;
    } on DioException catch (e) {
      print("Error in PUT request: ${e.response?.data}");
      throw e;
    }
  }}