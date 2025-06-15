import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String name;
  final String phoneNumber;
  final String country;
  final String email;
  final DateTime dateOfBirth;
  final String? profileImage;
  final String profileImageUrl;

  const UserProfile({
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.email,
    required this.dateOfBirth,
    this.profileImage,
    required this.profileImageUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      country: json['country'] ?? '',
      email: json['email'] ?? '',
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      profileImage: json['profileImage'],
      profileImageUrl: json['profileImageUrl'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        name,
        phoneNumber,
        country,
        email,
        dateOfBirth,
        profileImage,
        profileImageUrl,
      ];
}
