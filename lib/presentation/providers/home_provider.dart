import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimblerx_app/data/models/pharmacy_list.dart';
import 'package:nimblerx_app/data/repositories/pharmacy_data.dart';

final pharmacyDataProvider = Provider<PharmacyRepository>((ref) => PharmacyRepository());

final pharmacyListProvider = FutureProvider<List<PharmacyListPharmacies?>>((ref) async {
  return ref.read(pharmacyDataProvider).getAllPharmacies();
});
