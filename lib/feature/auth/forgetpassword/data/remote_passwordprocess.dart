import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';

import '../../../../core/network/api_dio.dart';
import '../../../../core/utiles/app_consts.dart';

abstract class BaseRemotePasswordBrocess<T> {
  Future<Response> sendemailverify({data});

  Future<Response> checkotp({data});

  Future<Response> createnewpassword({data});
}

class RemotePasswordProcces extends BaseRemotePasswordBrocess<Response?> {
  @override
  Future<Response> createnewpassword({data}) async {
    try {
      Response? result = await sl<DioNetwork>().post(
        data: data,
        url: baseurl.newpasswordurl,
      );

      return result;
    } on DioException catch (e) {
      print("errrrrror ${e.response!.data}");
      throw e;
    } catch (e) {
      print("errrroror in remote create new password ${e.toString()}");
      throw e;
    }
  }

  @override
  Future<Response> sendemailverify({data}) async {
    Response result = await sl<DioNetwork>().post(
      data: {"email": "mostafasalem39956@gmail.com"},
      url: baseurl.sendverification,
    );
    return result;
  }

  @override
  Future<Response> checkotp({data}) async {
    Response? result = await sl<DioNetwork>().post(
      data: data,
      url: baseurl.emailvrifcationurl,
    );

    return result;
  }
}
