import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/history_feature/data/model_history.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

import '../../domain/history_interface.dart';
import '../remote/history_remoteprocces.dart';

class FetchHistoryRepo extends BaseHistoryRepo {
  final BaseRemoteHistory _baseRemoteHistory;

  FetchHistoryRepo(this._baseRemoteHistory);

  @override
  Future<Either<Failure, Unit>> delete([HsirotyResponseModel? pr]) async {
    try {
      await _baseRemoteHistory.delet(pr: pr!.tojson());
      return Right(unit);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e));
    }
  }

  @override
  Future<Either<Failure, List<VoiceEntity>>> fetch() async {
    try {
      Response reslt = await _baseRemoteHistory.fetch();

      HsirotyResponseModel model = HsirotyResponseModel.fromjson(
        lst: reslt.data,
      );

      return Right(model.listofhistory);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e));
    } catch (e) {
      return Left(Failure.firbaseeror(e.toString()));
    }
  }
}
