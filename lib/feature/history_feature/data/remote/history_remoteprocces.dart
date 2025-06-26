import 'package:dio/dio.dart';
import 'package:truetone/core/di/si.dart';
import 'package:truetone/core/network/api_dio.dart';

import '../../../../core/utiles/app_consts.dart';

abstract class BaseRemoteHistory {
  Future<Response> fetch();

  Future<Response> delet({required String pr});
}

class RemoteHistory extends BaseRemoteHistory {
  @override
  Future<Response> delet({required String pr}) async {
    String url = "${baseurl.delethistory}/$pr";
    Response resonse = await sl<DioNetwork>().delete(url: url);

    return resonse;
  }

  @override
  Future<Response> fetch() async {
    Response resonse = await sl<DioNetwork>().get(url: baseurl.fetchhistory);
    return resonse;
  }
}
