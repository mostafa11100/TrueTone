import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/features/auth/signup/data/mapper/entity_tomodel_maper.dart';
import 'package:truetone/features/auth/signup/data/remote_datasource/signup_remote.dart';
import 'package:truetone/features/auth/signup/domain/entitys/signup_entity.dart';
import 'package:truetone/features/auth/signup/domain/interfaces/signup_interface.dart';

class SignupRepoImp extends BaseSignUp<Unit, SignUpEntity> {
  final BaseRemoteSignUp _remotesignup;
  SignupRepoImp(this._remotesignup);
  @override
  signup({SignUpEntity? signupentity}) async {
    try {
      await _remotesignup.signup(json: signupentity!.tosignupmodel().tojson());
      return Right(unit);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e.response!.statusCode));
    }
  }
}
