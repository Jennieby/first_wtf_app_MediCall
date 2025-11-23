import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_wtf_app/models/hospital_details.dart';
import 'package:flutter/material.dart';

class HospitalNotifier extends ChangeNotifier {
  List<HospitalDetails> hospitals = [];

  HospitalNotifier(){
    fetchHospitals();
  }

  void fetchHospitals() async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection("hospitals")
        .get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in query.docs) {
      Map<String, dynamic> docData = doc.data();
      HospitalDetails hospital = HospitalDetails.fromJson(docData);
      hospitals.add(hospital);
      notifyListeners();
    }
  }
}
