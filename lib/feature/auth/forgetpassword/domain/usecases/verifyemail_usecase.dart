import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/core/helper/shared_pref.dart';
import 'package:truetone/feature/auth/forgetpassword/domain/interfacess/password_procces_interface.dart';

import '../../../../../core/di/si.dart';
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
    String? email=  await sl<Cashhelper>().getemail();
    String? otpfromcashing=await sl<Cashhelper>().getotp();
    if(otpfromcashing!=null)
    return  await _basePasswordProccess.createpasword(
      newpaosswrdmodel: PasswordProccesModel(password: password,email: email,otp: otpfromcashing),
    );
    else
      {
        return Left(Failure.networkError());
      }

  }
}

class CheckOtpUseCase {
  BasePasswordProccess<Unit> _basePasswordProccess;

  CheckOtpUseCase(this._basePasswordProccess);

  Future<Either<Failure, Unit>> excute(otp) async
  {
   await sl<Cashhelper>().setotp(otp);
   String? email=  await sl<Cashhelper>().getemail();
   print("emaillll===$email");
    return  await _basePasswordProccess.checkotp(
      otp: PasswordProccesModel(otp:otp,email: email),
    );

  }
}
class Sendotptomail {
  BasePasswordProccess<Unit> _basePasswordProccess;

  Sendotptomail(this._basePasswordProccess);

  Future<Either<Failure, Unit>> excute(email) async
  {  sl<Cashhelper>().setemail(email);
    return  await _basePasswordProccess.sendcode(
      email: PasswordProccesModel(email: email),
    );

  }
}
