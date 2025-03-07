import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/auth/forgetpassword/domain/interfacess/password_procces_interface.dart';

import '../../data/models/pasword_procces_model.dart';

class VerifyEmailUseCase {
  BasePasswordProccess<Unit> _basePasswordProccess;

  VerifyEmailUseCase(this._basePasswordProccess);

  Future<Either<Failure, Unit>> excute(email) async {
  return  await _basePasswordProccess.sendcode(
      email: PasswordProccesModel(email: email),
    );

  }
}

class CreateNewPasswordUseCase {
  BasePasswordProccess<Unit> _basePasswordProccess;

  CreateNewPasswordUseCase(this._basePasswordProccess);

  Future<Either<Failure, Unit>> excute(password) async {
    return  await _basePasswordProccess.createpasword(
      password: PasswordProccesModel(password: password),
    );

  }
}

class CheckOtpUseCase {
  BasePasswordProccess<Unit> _basePasswordProccess;

  CheckOtpUseCase(this._basePasswordProccess);

  Future<Either<Failure, Unit>> excute(otp) async {
    return  await _basePasswordProccess.checkotp(
      otp: PasswordProccesModel(otp:otp),
    );

  }
}
