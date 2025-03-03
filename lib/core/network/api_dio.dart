import 'package:dio/dio.dart';

class DioNetwork {
  static final DioNetwork _dioNetwork = DioNetwork._nstance();

  late Dio _dio;
  factory DioNetwork.init() {
    return _dioNetwork;
  }
  DioNetwork._nstance() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handle) {
          //add options in any request

          return handle.next(options);
        },
      ),
    );
    {}

    // init dio;
  }

  Future<Response?> request({url, data}) async {
    Response? response;

    response = await _dio.request(url, data: data);

    return response;
  }

  Future uploadfile({Map<String, dynamic>? json, filepath, apikey}) async {}
  Future get({Map<String, dynamic>? pramiter, apikey}) async {}
  Future update({Map<String, dynamic>? json, apikey}) async {}
  Future delete({Map<String, dynamic>? json, apikey}) async {}
}
