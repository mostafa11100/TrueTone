import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/network/api_dio.dart';

import '../../../../core/utiles/app_consts.dart';

abstract class BaseRemoteHistory {
  Future<Response> fetch();

  Future<Response> delet({required Map<String,dynamic>  pr});
}

class RemoteHistory extends BaseRemoteHistory {
  @override
  Future<Response> delet({required Map<String,dynamic> pr}) async {

    Response resonse = await sl<DioNetwork>().get(
      data: pr,
      url: baseurl.delethistory,
    );
    return resonse;
  }

  @override
  Future<Response> fetch() async {

      Response resonse = await sl<DioNetwork>().get(
        data: {},
        url: baseurl.fetchhistory,
      );
      print("after  remote   ${resonse.data}");
      return resonse;

  }
}
