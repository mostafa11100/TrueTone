import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';

import 'package:truetone/core/network/api_servise.dart';
import 'package:truetone/feature/setting/data/model.dart';
import 'package:truetone/core/network/api_dio.dart';
import 'package:truetone/feature/setting/data/rebo/homerebo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserProfile>> fetchProfile() async {
    try {
      final response = await apiService.get("profile");  // Assuming the endpoint for the profile is "profile"
      if (response != null) {
        return Right(UserProfile.fromJson(response));
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

      final response = await apiService.put("complete-profile", data: data);
      
      if (response != null) {
        return Right(UserProfile.fromJson(response));
      } else {
        return Left(Failure.networkError());
      }
    } catch (e) {
      return Left(Failure.networkError());
    }
  }
}
