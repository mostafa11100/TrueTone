import 'package:dio/dio.dart';

import '../di/si.dart';
import '../helper/shared_pref.dart';
import '../utiles/app_consts.dart';

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

          options.headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          };
          return handle.next(options);
        },
        onError: (e, h) async {
          try {
            if (e.response!.statusCode == 401) {
              try {
                String? rfrshtoken = sl<Cashhelper>().getrefreshtoken();
                Map<String, dynamic> newtoken = await refreshtoken(rfrshtoken);

                sl<Cashhelper>().setrefreshtoken(newtoken['refresh']);
                sl<Cashhelper>().setusertoken(newtoken['token']);
                e.requestOptions.headers['Authorization'] =
                    'Bearer ${newtoken['token']}';

                Response res = await get(
                  url: e.requestOptions.uri.toString(),
                  data: e.requestOptions.data,
                );
                //https: //truetoneapi.runasp.net/api/AudioAnalysis/history
                return h.resolve(res);
              } on DioException catch (e2) {
                return h.reject(e2);
              } catch (ee) {
                return h.reject(e);
              }
            } else {
              return h.reject(e);
            }
          } catch (er) {
            return h.reject(e);
          }
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
      throw e;
    }
  }

  Future<Response> post({url, data}) async {
    try {
      Response response;
      response = await _dio.post(url, data: data);

      return response;
      //return Response(requestOptions: RequestOptions());
    } catch (e) {
      throw e;
    }
  }

  Future<Response> uploadfile({
    required String url,
    required Map<String, dynamic> json,
  }) async {
    try {
      String? token = await sl<Cashhelper>().getusertoken();
      Map<String, dynamic> header = {
        'accept': '*/*',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      };
      final formData = FormData.fromMap(json);

      final Response response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: header),
      );
      return response;
    } on DioException catch (e) {
      print("in exeption ${e.response!.statusCode}");
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<Response> get({url, Map<String, dynamic>? data}) async {
    Response? response;
    try {
      response = await _dio.get(url);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future delete({Map<String, dynamic>? data, url}) async {
    Response? response;
    try {
      response = await _dio.delete(url, data: data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> refreshtoken(token) async {
    Response? response;
    try {
      response = await _dio.post(baseurl.refreshtoken, data: {"token": token});

      String newtoken = response.data['token'];
      String rfrsh = response.data['refreshToken'];

      return {"token": newtoken, "refresh": rfrsh};
    } catch (e) {
      throw e;
    }
  }

  Future update({Map<String, dynamic>? json, apikey}) async {}
}
