import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/auth/forgetpassword/data/models/pasword_procces_model.dart';
import 'package:truetone/feature/auth/forgetpassword/data/remote_passwordprocess.dart';

import '../../domain/interfacess/password_procces_interface.dart';

class PasswordProccesImp extends BasePasswordProccess<Unit> {
  final BaseRemotePasswordBrocess _remote;
  PasswordProccesImp(this._remote);
  @override
  Future<Either<Failure, Unit>> createpasword({
    required PasswordProccesModel newpaosswrdmodel,
  }) async {
    try {
      print(newpaosswrdmodel.tojson());
      Response response = await _remote.createnewpassword(
        data: newpaosswrdmodel.tojson(),
      );
      return Right(unit);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e));
    } catch (e) {
      return Left(Failure.gineralerror(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendcode({
    required PasswordProccesModel email,
  }) async {
    try {
      print("enter to send codeee ${email.tojson()}");
      Response response = await _remote.sendemailverify(data: email.tojson());
      print(response.data);
      return Right(unit);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkotp({
    required PasswordProccesModel otp,
  }) async {
    try {
      await _remote.checkotp(data: otp.tojson());
      return Right(unit);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e));
    }
  }
}
