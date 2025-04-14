import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/network/api_dio.dart';

import '../../../../core/utiles/app_consts.dart';

abstract class BaseRemoteHistory {
  Future<Response> fetch({required Map<String,dynamic> pr});

  Future<Response> delet({required Map<String,dynamic>  pr});
}

class RemoteHistory extends BaseRemoteHistory {
  @override
  Future<Response> delet({required Map<String,dynamic> pr}) async {
    Response resonse = await sl<DioNetwork>().get(
      data: pr,
      url: baseurl.fetchhistory,
    );
    return resonse;
  }

  @override
  Future<Response> fetch({required Map<String,dynamic> pr}) async {
    Response resonse = await sl<DioNetwork>().delete(
      data: pr,
      url: baseurl.delethistory,
    );
    return resonse;
  }
}
