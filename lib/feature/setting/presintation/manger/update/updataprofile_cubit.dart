
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truetone/feature/setting/date/rebo/homerebo.dart';
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
    debugPrint("📤 Sending updateProfile request with data:");
    debugPrint("  📝 name: $name");
    debugPrint("  📞 phoneNumber: $phoneNumber");
    debugPrint("  🌍 country: $country");
    debugPrint("  📧 email: $email");
    debugPrint("  🎂 dateOfBirth: $dateOfBirth");
    debugPrint("  🖼️ profileImage: $profileImage");

    final result = await homeRepo.updateProfile(
      name: name,
      phoneNumber: phoneNumber,
      country: country,
      email: email,
      dateOfBirth: dateOfBirth,
      profileImage: profileImage,
    );

    result.fold(
      (failure) {
        
        emit(UpdateProfileFailure(failure.error ?? "Unexpected Error"));
      },
      (profile) {
        debugPrint("✅ updateProfile succeeded. New profile: $profile");
        emit(UpdateProfileSuccess(profile));
      },
    );
  }
}