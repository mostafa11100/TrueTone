import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import '../../../../../core/di/si.dart';
import '../../../../../core/helper/shared_pref.dart';
import '../entitys/signup_entity.dart';
import '../interfaces/signup_interface.dart';

class SignupUsecase {
  final BaseSignUp<Unit, SignUpEntity?> _baseSignUp;
  SignupUsecase(this._baseSignUp);
  Future<Either<Failure, Unit>> signup({SignUpEntity? signupentity}) async
  {
    await sl<Cashhelper>().setemail(signupentity!.email);
    Either<Failure, Unit> result = await _baseSignUp.signup(
      signupentity: signupentity,
    );
    return result;
  }
}
