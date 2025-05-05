import 'package:dio/dio.dart';
import 'package:truetone/core/error/exeptions.dart';

import '../di/si.dart';
import '../helper/shared_pref.dart';

class DioNetwork {
  static final DioNetwork _dioNetwork = DioNetwork._nstance();

  late Dio _dio;

  factory DioNetwork.init() {
    return _dioNetwork;
  }

  DioNetwork._nstance() {
    BaseOptions options = BaseOptions(
      followRedirects: true,

      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handle) async {
          //add options in any request

          String? token = await sl<Cashhelper>().getusertoken();
          options.headers = {'Content-Type': 'application/json','Authorization':'Bearer $token'};
          return handle.next(options);
        },
        onError: (e, h) {
          if (e.response!.statusCode == 401) {
            // refresh token her and save in  shasred pref
          }
          return h.next(e);
        },
      ),
    );

    // init dio;
  }

  Future<Response?> request({url, data}) async {
    Response? response;
    try {
      response = await _dio.request(url, data: data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response?> post({url, data}) async {
    try {
      Response? response;
      response = await _dio.post(url, data: data);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> uploadfile({
    required String url,
    required Map<String, dynamic> json,
  }) async {
    try {
      final formData = FormData.fromMap(json);
      final Response response = await _dio.get(url, data: formData);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> get({url, Map<String, dynamic>? data}) async {
    Response? response;
    try {
      response = await _dio.get(url, data: data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future delete({Map<String, dynamic>? data, url}) async {
    Response? response;
    try {
      response = await _dio.delete(url, data: data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future update({Map<String, dynamic>? json, apikey}) async {}
}
