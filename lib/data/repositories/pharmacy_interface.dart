import 'package:nimblerx_app/data/models/pharmacy_details.dart';
import 'package:nimblerx_app/data/models/pharmacy_list.dart';

abstract class IPharmacyRepository {
  Future<PharmacyDetails> getPharmacyDetails(String pharmacyId);
  Future<List<PharmacyListPharmacies?>> getAllPharmacies();
  Future<List<String>> getAllMedications();
}
