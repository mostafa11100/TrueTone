import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/features/auth/signup/domain/entitys/signup_entity.dart';
import 'package:truetone/features/auth/signup/domain/interfaces/signup_interface.dart';

class SignupUsecase {
  final BaseSignUp<Unit, SignUpEntity?> _baseSignUp;
  SignupUsecase(this._baseSignUp);
  Future<Either<Failure, Unit>> signup({SignUpEntity? signupentity}) async {
    Either<Failure, Unit> result = await _baseSignUp.signup(
      signupentity: signupentity,
    );
    return result;
  }
}
