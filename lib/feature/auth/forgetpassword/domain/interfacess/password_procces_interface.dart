import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/auth/forgetpassword/data/models/pasword_procces_model.dart';

abstract class BasePasswordProccess<T> {
  Future<Either<Failure, T>> sendcode({required PasswordProccesModel email});
  Future<Either<Failure, T>> checkotp({required PasswordProccesModel otp});
  Future<Either<Failure, T>> createpasword({
    required PasswordProccesModel newpaosswrdmodel,
  });
}
