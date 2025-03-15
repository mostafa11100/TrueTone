import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';

abstract class BasePasswordProccess<T>


{
  Future<Either<Failure,T>> sendcode({ email});
  Future<Either<Failure,T>> checkotp({ otp});
  Future<Either<Failure,T>> createpasword({newpaosswrdmodel});
}
