import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';

abstract class BaseSignUp<T, prametar> {
  Future<Either<Failure, T>> signup({prametar signupentity});
}
