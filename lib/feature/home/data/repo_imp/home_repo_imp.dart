import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/home/data/mapers/convert_to_home_models.dart';
import 'package:truetone/feature/home/data/models/uploadfile_model.dart';
import 'package:truetone/feature/home/data/remote/remote_home.dart';
import 'package:truetone/feature/home/domain/%20entitys/homeentity_uploadfile.dart';
import 'package:truetone/feature/home/domain/interfaces/home_interface.dart';

class HomeCheckFileTypeRepo extends HomeInterface {
  HomeRemoteUploadFile _remoteUploadFile;

  HomeCheckFileTypeRepo(this._remoteUploadFile);

  @override
  Future<Either<Failure, HomeModel>> checkaudiotype({
    HomeEntity? homeentity,
  }) async
  {
    try {
      Response result = await _remoteUploadFile.uploadfile(
        homemodel: homeentity!.tohomemodel(),
      );
      return Right(HomeModel.fromjson(json: result.data));
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e));
    }
  }
}
