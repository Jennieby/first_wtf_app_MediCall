// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalDetails _$HospitalDetailsFromJson(Map<String, dynamic> json) =>
    HospitalDetails(
      id: json['id'] as String,
      address: json['address'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      numberOfAmbulances: (json['numberOfAmbulances'] as num).toInt(),
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      website: json['website'] as String? ?? "",
      phoneNumber: (json['phoneNumber'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HospitalDetailsToJson(HospitalDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'name': instance.name,
      'description': instance.description,
      'numberOfAmbulances': instance.numberOfAmbulances,
      'rating': instance.rating,
      'website': instance.website,
      'phoneNumber': instance.phoneNumber,
    };
