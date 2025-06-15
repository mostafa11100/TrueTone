

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:truetone/feature/setting/date/model.dart';
import 'package:truetone/feature/setting/date/rebo/homerebo.dart';

part 'fetchprofile_state.dart';

class FetchProfileCubit extends Cubit<FetchProfileState> {
  final HomeRepo homeRepo;

  FetchProfileCubit(this.homeRepo) : super(FetchProfileInitial());

  Future<void> fetchProfile() async {
    emit(FetchProfileLoading());
    final result = await homeRepo.fetchProfile();
    result.fold(
      (failure) => emit(FetchProfileFailure(failure.error??"UNexpected error")),
      (profile) => emit(FetchProfileSuccess(profile)),
    );
  }}