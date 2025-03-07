import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String? email;
  final String? password;
  const SignUpEntity({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
