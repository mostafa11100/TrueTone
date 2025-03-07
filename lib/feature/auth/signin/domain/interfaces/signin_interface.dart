import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';

abstract class BaseSignin<T, pramitar> {
  Future<Either<Failure, T>> excute(pramitar entity);
}
