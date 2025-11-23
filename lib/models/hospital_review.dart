import 'package:first_wtf_app/models/user_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hospital_review.g.dart';

@JsonSerializable()
class HospitalReview {
  final String message;
  final UserDetails user;
  final DateTime date;

  HospitalReview({
    required this.message,
    required this.user,
    required this.date,
  });

  Map<String, dynamic> toJson() => _$HospitalReviewToJson(this);

  factory HospitalReview.fromJson(Map<String, dynamic> json) => _$HospitalReviewFromJson(json);
}
