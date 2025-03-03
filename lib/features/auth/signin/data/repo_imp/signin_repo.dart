import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/features/auth/signin/data/remote/remote_signin.dart';
import 'package:truetone/features/auth/signin/domain/entitys/signin_entity.dart';
import 'package:truetone/features/auth/signin/domain/interfaces/signin_interface.dart';

class SigninRepo extends BaseSignin<Unit, SignInEntity> {
  BaseRemoteSignIn _remoteSignIn;
  SigninRepo(this._remoteSignIn);
  @override
  Future<Either<Failure, Unit>> excute(entity) {
    _remoteSignIn.excute();
  }
}
