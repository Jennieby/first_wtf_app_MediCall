// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalReview _$HospitalReviewFromJson(Map<String, dynamic> json) =>
    HospitalReview(
      message: json['message'] as String,
      user: UserDetails.fromJson(json['user'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$HospitalReviewToJson(HospitalReview instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'date': instance.date.toIso8601String(),
    };
