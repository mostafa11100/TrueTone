part of 'fetchprofile_cubit.dart';

abstract class FetchProfileState extends Equatable {
  const FetchProfileState();

  @override
  List<Object?> get props => [];
}

class FetchProfileInitial extends FetchProfileState {}

class FetchProfileLoading extends FetchProfileState {}

class FetchProfileSuccess extends FetchProfileState {
  final UserProfile profile;

  const FetchProfileSuccess(this.profile);

  @override
  List<Object?> get props => [profile];
}

class FetchProfileFailure extends FetchProfileState {
  final String message1;

  const FetchProfileFailure(this.message1);

  @override
  List<Object?> get props => [message1];}