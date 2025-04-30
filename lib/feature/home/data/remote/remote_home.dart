import 'package:dio/dio.dart';
import 'package:truetone/feature/home/data/models/uploadfile_model.dart';

import '../../../../core/di/si.dart';
import '../../../../core/network/api_dio.dart';
import '../../../../core/utiles/app_consts.dart';

abstract class BaseHomeRemote {
  Future<Response> uploadfile({HomeModel? homemodel});
}

class HomeRemoteUploadFile extends BaseHomeRemote {
  @override
  Future<Response> uploadfile({HomeModel? homemodel}) async
  {
    Response result = await sl<DioNetwork>().uploadfile(
      url: baseurl.uploadfile,
      json: await homemodel!.tojson(),
    );
    return result;
  }
}
