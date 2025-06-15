import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/helper/shared_pref.dart';

class ApiService {
  final String _baseUrl = "https://truetoneapi.runasp.net/api/Auth/";
  final Dio _dio;
  

  ApiService(this._dio);

 

 Future< Map<String, String>> _getHeaders() async{
     String? token = await sl<Cashhelper>().getusertoken();
    if (token != null) {
      return {
        'Authorization': 'Bearer $token',
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
        options: Options(headers:await _getHeaders()),
      );
      print("GET request successful: ${response.data}");
      return response.data;
    } on DioException catch (e) {
      print("Error in GET request: ${e.message}");
      print("Error Response: ${e.response?.data}");
      print("Status Code: ${e.response?.statusCode}");
      throw e;
    }
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? data}) async {
  try {
    FormData formData = FormData.fromMap(data ?? {});
    
    var response = await _dio.put(
      "$_baseUrl$endpoint",
      data: formData,
      options: Options(
        headers: {
          ...(await _getHeaders())..remove('Content-Type'), // مهم تشيله علشان Dio يضيفه تلقائيًا
        },
      ),
    );

    print("PUT request successful: ${response.data}");
    return response.data;
  } on DioException catch (e) {
    print("Error in PUT request: ${e.message}");
    print("Error Response: ${e.response?.data}");
    print("Status Code: ${e.response?.statusCode}");
    throw e;
  }
}
}
