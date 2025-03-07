part of 'signin_cubit.dart';

sealed class SigninState extends Equatable {
  const SigninState();
}

final class SigninInitial extends SigninState {
  @override
  List<Object> get props => [];
}


final class SigninLoading extends SigninState {
  @override
  List<Object> get props => [];
}


final class SigninSuccess extends SigninState {
  @override
  List<Object> get props => [];
}


final class SigninFail extends SigninState {
 final String error;
 const SigninFail(this.error);
  @override
  List<Object> get props => [error];
}
