import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/domain/history_interface.dart';

import '../../data/model_history.dart';

class UseCaseHistoryfitch {
  UseCaseHistoryfitch(this._baseHistoryRepo);

  BaseHistoryRepo _baseHistoryRepo;

  Future<Either<Failure, List<VoiceEntity>>> excute({
    required HsirotyResponseModel data,
  }) async {
    try {
      Either<Failure, List<VoiceEntity>> result =
          await _baseHistoryRepo.fetch();
      return result;
    } catch (e) {
      return Left(Failure.gineralerror(e.toString()));
    }
  }
}

class UseCaseDelete {
  UseCaseDelete(this._baseHistoryRepo);

  BaseHistoryRepo _baseHistoryRepo;

  Future<Either<Failure, Unit>> excute({required VoiceEntity data}) async {
    Either<Failure, Unit> result = await _baseHistoryRepo.delete(data);
    return result;
  }
}
