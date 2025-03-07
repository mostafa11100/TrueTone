import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';

import '../../../../core/network/api_dio.dart';
import '../../../../core/utiles/app_consts.dart';

abstract class BaseRemotePasswordBrocess<T> {
  Future<T> sendemailverify({data});
  Future<T> checkotp({data});
  Future<T> createnewpassword({data});
}

class RemotePasswordProcces extends BaseRemotePasswordBrocess<Response?> {
  @override
  Future<Response?> createnewpassword({data}) async {

    Response? result = await sl<DioNetwork>().request(
      data: data,
      url: newpasswordurl,
    );

    return result;
  }

  @override
  Future<Response?> sendemailverify({data}) async
  {

    Response? result = await sl<DioNetwork>().request(
      data: data,
      url: emailvrifcationurl,
    );
    return result;
  }

  @override
  Future<Response?> checkotp({data}) async
  {
    Response? result = await sl<DioNetwork>().request(
      data: data,
      url: emailvrifcationurl,
    );

    return result;
  }
}
