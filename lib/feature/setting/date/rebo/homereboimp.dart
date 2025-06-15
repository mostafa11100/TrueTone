import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart' show debugPrint;
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/core/network/api_servise.dart';
import 'package:truetone/feature/setting/date/model.dart';
import 'package:truetone/feature/setting/date/rebo/homerebo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserProfile>> fetchProfile() async {
    try {
      final response = await apiService.get("profile");
      if (response != null) {
        return Right(UserProfile.fromJson(response['data']));
      } else {
        return Left(Failure.networkError());
      }
    } catch (e) {
     
      return Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, UserProfile>> updateProfile({
    String? name,
    String? phoneNumber,
    String? country,
    String? email,
    DateTime? dateOfBirth,
    String? profileImage,
  }) async {
    try {
      final data = {
        'name': name,
        'phoneNumber': phoneNumber,
        'country': country,
        'email': email,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'profileImage': profileImage,
      };

      debugPrint("🌐 PUT /complete-profile with data: $data");

      final response = await apiService.put("complete-profile", data: data);

      if (response == null) {
   
        return Left(Failure.networkError());
      }

      debugPrint("📥 PUT response: $response");

      final message = response['message'];
      final profileData = response['data'];

      if (message != "Succeeded") {
    
        return Left(Failure.networkError());
      }

      if (profileData == null) {
     

        final updatedProfile = UserProfile(
          name: name ?? '',
          phoneNumber: phoneNumber ?? '',
          country: country ?? '',
          email: email ?? '',
          dateOfBirth: dateOfBirth ?? DateTime.now(),
          profileImageUrl: profileImage ?? '',
        );

        return Right(updatedProfile);
      }

      try {
        final updatedProfile = UserProfile.fromJson(profileData);
        debugPrint("✅ Parsed UserProfile successfully: $updatedProfile");
        return Right(updatedProfile);
      } catch (e) {
   
        return Left(Failure.networkError());
      }

    } catch (e, stackTrace) {
    
      return Left(Failure.networkError());
    }
  }
}
