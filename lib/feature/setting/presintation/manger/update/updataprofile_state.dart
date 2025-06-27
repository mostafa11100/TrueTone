import 'package:equatable/equatable.dart';

import 'package:truetone/feature/setting/date/model.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object?> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UserProfile profile;

  const UpdateProfileSuccess(this.profile);

  @override
  List<Object?> get props => [profile];
}

class UpdateProfileFailure extends UpdateProfileState {
  final String message;

  const UpdateProfileFailure(this.message);

  @override
  List<Object?> get props => [message];
}
