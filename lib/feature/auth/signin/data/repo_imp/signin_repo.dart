import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/core/helper/shared_pref.dart';
import 'package:truetone/feature/auth/signin/data/mapper/maperformentoty_tomodel.dart';
import 'package:truetone/feature/auth/signin/data/model/signin_model.dart';
import '../../../../../core/di/si.dart';
import '../../domain/entitys/signin_entity.dart';
import '../../domain/interfaces/signin_interface.dart';
import '../remote/remote_signin.dart';

class SigninRepo extends BaseSignin<Unit, SignInEntity> {
  final BaseRemoteSignIn  _remoteSignIn;
  SigninRepo(this._remoteSignIn);
  @override
  Future<Either<Failure, Unit>> excute(SignInEntity entity) async
  {
    try {
      SigninModel mdel = entity.maptosigninmodel();
      Response? result = await _remoteSignIn.excute(mdel.tojson());
      // cashinggg=====>
     await sl<Cashhelper>().setusertoken(result!.data['token']);
     await sl<Cashhelper>().setuserlogin();

     return Right(unit);

    }on DioException catch(e)
    {
      return Left(Failure.handleHttpError(e));
    }
    catch(e)
    { return Left(Failure.firbaseeror(e.toString()));}
  }
}
