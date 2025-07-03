import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';

abstract class BaseHistoryRepo {
  Future<Either<Failure, List<VoiceEntity>>> fetch();
  Future<Either<Failure, Unit>> delete([VoiceEntity pr]);
}
