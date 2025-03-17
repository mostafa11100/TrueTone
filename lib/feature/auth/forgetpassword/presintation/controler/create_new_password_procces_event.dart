part of 'create_new_password_procces_bloc.dart';

sealed class CreateNewPasswordProccesEvent extends Equatable {
  const CreateNewPasswordProccesEvent();
}


 class SendOTP extends CreateNewPasswordProccesEvent
{
 final String email;
  const SendOTP(this.email);

  @override
  List<Object?> get props => [email];
}

 class VerifyOTP extends CreateNewPasswordProccesEvent
{
  final String otp;
  const VerifyOTP(this.otp);

  @override
  // TODO: implement props
  List<Object?> get props =>[otp];
}
 class NewPassword extends CreateNewPasswordProccesEvent
{
  final String password;
  const NewPassword(this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}