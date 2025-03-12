import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/history_feature/data/remote/history_remoteprocces.dart';
import 'package:truetone/feature/history_feature/domain/entitys/voice_entity.dart';
import 'package:truetone/feature/history_feature/domain/history_interface.dart';

class UseCaseHistoryfitch
{
  UseCaseHistoryfitch(this._baseHistoryRepo);
BaseHistoryRepo _baseHistoryRepo;
 Future<Either<Failure, dynamic>> excute({data})async
 {
   Either<Failure, dynamic> result=await  _baseHistoryRepo.fetch( data);
   return result;
 }
}

