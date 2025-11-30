import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  final String name;
  final String email;
  final String profilePicture;
  final String phoneNumber;
  final String address;
  final String occupation;
  final String gender;

  const UserDetails({
    required this.name,
    required this.email,
    this.profilePicture = "",
    this.phoneNumber = "",
    this.address = "",
    this.occupation = "",
    this.gender = "",
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
