
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:truetone/feature/auth/signup/data/mapper/entity_tomodel_maper.dart';

import '../../../../../core/error/Failure.dart';
import '../../domain/entitys/signup_entity.dart';
import '../../domain/interfaces/signup_interface.dart';
import '../remote_datasource/signup_remote.dart';

class SignupRepoImp extends BaseSignUp<Unit, SignUpEntity> {
  final BaseRemoteSignUp _remotesignup;
  SignupRepoImp(this._remotesignup);
  @override
  signup({SignUpEntity? signupentity}) async {
    try {
      await _remotesignup.signup(json: signupentity!.tosignupmodel().tojson());
      return Right(unit);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e));
    }
  }
}
