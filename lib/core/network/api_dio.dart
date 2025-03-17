import 'package:dio/dio.dart';
import 'package:truetone/core/error/exeptions.dart';

class DioNetwork {
  static final DioNetwork _dioNetwork = DioNetwork._nstance();

  late Dio _dio;
  factory DioNetwork.init() {
    return _dioNetwork;
  }
  DioNetwork._nstance() {
    BaseOptions options = BaseOptions(
      validateStatus: (i)

      {
        print("stattttttttt  $i");

       return i==200;
      },
      connectTimeout: Duration(seconds: 3),
      receiveTimeout: Duration(seconds: 3),
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handle) {
          //add options in any request
options.headers={'Content-Type': 'application/json'};
          return handle.next(options);
        },


      ),
    );


    // init dio;
  }

  Future<Response?> request({url, data}) async {
    Response? response;

      response = await _dio.request(url, data: data);
      return response;


    return response;
  }
  Future<Response?> post({url, data}) async {
    Response? response;
  response = await _dio.post(url, data: data);

return response;

  }

  Future uploadfile({Map<String, dynamic>? json, filepath, apikey}) async {}
  Future get({ url,Map<String, dynamic>? data}) async
  { Response? response;

  response = await _dio.get(url, data: data);
  return response;

  }
  Future update({Map<String, dynamic>? json, apikey}) async {}
  Future delete({Map<String, dynamic>? json, apikey}) async {}
}
