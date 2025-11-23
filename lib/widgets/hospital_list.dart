import 'package:first_wtf_app/models/hospital_details.dart';
import 'package:first_wtf_app/provider/hospital_notifier.dart';
import 'package:first_wtf_app/widgets/custom_hospitalcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({super.key, required this.search});
  final String search;
  @override
  Widget build(BuildContext context) {
    var hospitalNotifier = Provider.of<HospitalNotifier>(context);
    List<HospitalDetails> hospitals = hospitalNotifier.hospitals;

    // FILTERING
    List<HospitalDetails> filteredHospitals = hospitals.where((hospital) {
      String query = search.toLowerCase();

      return hospital.name.toLowerCase().contains(query) ||
             hospital.address.toLowerCase().contains(query);
    }).toList();


    return ListView.builder(
      itemCount: filteredHospitals.length,
      itemBuilder: (context, index) {
        var hospital = filteredHospitals[index];
        return CustomHospitalcard(
          hospitalName: hospital.name,
          hospitalLocation: hospital.address,
          hospitalRating: hospital.rating,
        );
      },
    );
  }
}