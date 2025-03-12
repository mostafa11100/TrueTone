import 'package:dartz/dartz.dart';

import 'package:truetone/core/error/Failure.dart';

import '../../domain/history_interface.dart';

class FetchHistoryRepo extends BaseHistoryRepo
{
  @override
  Future<Either<Failure, dynamic>> delete([pr])
  {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> fetch([pr]) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

}