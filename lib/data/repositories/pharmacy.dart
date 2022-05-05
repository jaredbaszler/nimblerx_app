import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:nimblerx_app/data/models/pharmacy_details.dart';
import 'package:nimblerx_app/data/models/pharmacy_list.dart';
import 'package:nimblerx_app/data/repositories/pharmacy_interface.dart';

class PharmacyRepository implements IPharmacyRepository {
  @override
  Future<List<String>> getAllMedications() async {
    final response = await get(
      Uri.parse(
        'https://s3-us-west-2.amazonaws.com/assets.nimblerx.com/prod/medicationListFromNIH/medicationListFromNIH.txt',
      ),
    );

    return response.body.split(',');
  }

  @override
  Future<List<PharmacyListPharmacies?>> getAllPharmacies() async {
    final pharmacyList = PharmacyList.fromJson(
      jsonDecode(await rootBundle.loadString('data/jsonModels/pharmacy_list.json'))
          as Map<String, dynamic>,
    );

    return pharmacyList.pharmacies ?? <PharmacyListPharmacies>[];
  }

  @override
  Future<PharmacyDetails> getPharmacyDetails(String pharmacyId) async {
    final response =
        await get(Uri.parse('https://api-qa-demo.nimbleandsimple.com/pharmacies/info/NRxPh-HLRS'));

    return PharmacyDetails.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
