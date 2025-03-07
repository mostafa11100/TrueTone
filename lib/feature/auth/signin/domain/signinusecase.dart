
import 'package:dartz/dartz.dart';
import 'package:truetone/feature/auth/signin/domain/entitys/signin_entity.dart';
import 'package:truetone/feature/auth/signin/domain/interfaces/signin_interface.dart';

import '../../../../core/error/Failure.dart';

class SigninUseCase<T>
{
  SigninUseCase(this._baseSignin);
   final BaseSignin<T,SignInEntity> _baseSignin;
  Future<Either<Failure, T>>  excute(SignInEntity entity)async
  {
    Either<Failure, T>  result=  await _baseSignin.excute(entity);
   return result;


  }
}