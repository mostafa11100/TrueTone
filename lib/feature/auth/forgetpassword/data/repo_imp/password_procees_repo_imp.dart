import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/auth/forgetpassword/data/remote_passwordprocess.dart';

import '../../domain/interfacess/password_procces_interface.dart';

class PasswordProccesImp extends BasePasswordProccess<Unit>

{
 final BaseRemotePasswordBrocess _remote;
  PasswordProccesImp(this._remote);
  @override
  Future<Either<Failure, Unit>> createpasword({password})async
  {

    try {
      await _remote.createnewpassword(data: password!.tojson());
      return Right(unit);
    }on DioException catch(e)
    {
      return Left(Failure.handleHttpError(e));
    }

  }

  @override
  Future<Either<Failure, Unit>> sendcode({email}) async{

    try {

      await _remote.sendemailverify(data: email.tojson());
      return Right(unit);
    }on DioException catch(e)
    {
      return Left(Failure.handleHttpError(e));
    }

  }

  @override
  Future<Either<Failure, Unit>> checkotp({otp}) async{

    try {
      await _remote.createnewpassword(data: otp.tojson());
      return Right(unit);
    }on DioException catch(e)
    {
      return Left(Failure.handleHttpError(e));
    }
  }

}
