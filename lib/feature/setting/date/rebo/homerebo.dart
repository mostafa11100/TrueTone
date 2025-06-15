
import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';
import 'package:truetone/feature/setting/date/model.dart';


abstract class HomeRepo {
  Future<Either<Failure, UserProfile>> fetchProfile();

  Future<Either<Failure, UserProfile>> updateProfile({
    String? name,
    String? phoneNumber,
    String? country,
    String? email,
    DateTime? dateOfBirth,
    String? profileImage,
  });}
