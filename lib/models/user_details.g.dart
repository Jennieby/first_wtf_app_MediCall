// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
  name: json['name'] as String,
  email: json['email'] as String,
  profilePicture: json['profilePicture'] as String? ?? "",
  phoneNumber: json['phoneNumber'] as String? ?? "",
  address: json['address'] as String? ?? "",
  occupation: json['occupation'] as String? ?? "",
  gender: json['gender'] as String? ?? "",
);

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'occupation': instance.occupation,
      'gender': instance.gender,
    };
