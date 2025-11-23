import 'package:json_annotation/json_annotation.dart';

part 'hospital_details.g.dart';

@JsonSerializable()

class HospitalDetails {
  final String id;
  final String address;
  final String name;
  final String description;
  final int numberOfAmbulances;
  final int rating;
  final String website;
  final List<String> phoneNumber;

  HospitalDetails({
    required this.id,
    required this.address,
    required this.name,
    required this.description,
    required this.numberOfAmbulances,
    this.rating = 0,
    this.website="",
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$HospitalDetailsToJson(this);

  factory HospitalDetails.fromJson(Map<String, dynamic> json) => _$HospitalDetailsFromJson(json);

}


