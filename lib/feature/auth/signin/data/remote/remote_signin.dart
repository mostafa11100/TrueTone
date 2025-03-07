import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/network/api_dio.dart';
import 'package:truetone/core/utiles/app_consts.dart';

abstract class BaseRemoteSignIn<T, pramitar> {
  Future<T?> excute(pramitar data);
}

class RemoteSignin extends BaseRemoteSignIn<Response, Map> {
  @override
  Future<Response?> excute(data) async {
    Response? response = await sl<DioNetwork>().request(
      url: baseurl,
      data: data,
    );
    return response;
  }
}
