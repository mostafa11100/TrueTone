part of 'signin_cubit.dart';

sealed class SigninState  {
  const SigninState();
}

final class SigninInitial extends SigninState {

}


final class SigninLoading extends SigninState {

}


final class SigninSuccess extends SigninState {
}


final class SigninFail extends SigninState {
 final String error;
 const SigninFail(this.error);

}
