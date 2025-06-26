import 'package:bloc/bloc.dart';
import 'package:truetone/feature/setting/data/rebo/homerebo.dart';
import 'package:truetone/feature/setting/presintation/manger/update/updataprofile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final HomeRepo homeRepo;

  UpdateProfileCubit(this.homeRepo) : super(UpdateProfileInitial());

  Future<void> updateProfile({
    String? name,
    String? phoneNumber,
    String? country,
    String? email,
    DateTime? dateOfBirth,
    String? profileImage,
  }) async {
    emit(UpdateProfileLoading());

    final result = await homeRepo.updateProfile(
      name: name,
      phoneNumber: phoneNumber,
      country: country,
      email: email,
      dateOfBirth: dateOfBirth,
      profileImage: profileImage,
    );

    result.fold(
      (failure) =>
          emit(UpdateProfileFailure(failure.error ?? "Unexpected Error")),
      (profile) => emit(UpdateProfileSuccess(profile)),
    );
  }
}
