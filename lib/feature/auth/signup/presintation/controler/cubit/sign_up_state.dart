part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSucces extends SignUpState {}

final class SignUpFail extends SignUpState {
  final String eror;
  const SignUpFail(this.eror);
}
