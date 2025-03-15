import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/network/api_dio.dart';
import 'package:truetone/core/utiles/app_consts.dart';

abstract class BaseRemoteSignUp {
  Future<Response?> signup({required Map<String, dynamic> json});
}

class SignupRemote extends BaseRemoteSignUp {
  @override
  Future<Response?> signup({Map<String, dynamic>? json}) async {
    Response? response = await sl<DioNetwork>().post(
      data: json,
      url: baseurl.signupurl,
    );
    return response;
  }
}
