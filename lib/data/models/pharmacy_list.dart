// TODO: consider a cleaner model generation and then make it
class PharmacyListPharmacies {
/*
{
  "name": "ReCept",
  "pharmacyId": "NRxPh-HLRS"
} 
*/
  PharmacyListPharmacies({
    this.name,
    this.pharmacyId,
  });

  PharmacyListPharmacies.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    pharmacyId = json['pharmacyId']?.toString();
  }

  String? name;
  String? pharmacyId;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['pharmacyId'] = pharmacyId;
    return data;
  }
}

class PharmacyList {
/*
{
  "pharmacies": [
    {
      "name": "ReCept",
      "pharmacyId": "NRxPh-HLRS"
    }
  ]
} 
*/
  PharmacyList({
    this.pharmacies,
  });
  PharmacyList.fromJson(Map<String, dynamic> json) {
    if (json['pharmacies'] != null && (json['pharmacies'] is List)) {
      final v = json['pharmacies'] as List;
      final arr0 = <PharmacyListPharmacies>[];
      for (final v in v) {
        arr0.add(PharmacyListPharmacies.fromJson(v as Map<String, dynamic>));
      }
      pharmacies = arr0;
    }
  }
  List<PharmacyListPharmacies>? pharmacies;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (pharmacies != null) {
      final v = pharmacies;
      final arr0 = <dynamic>[];
      for (final v in v!) {
        arr0.add(v.toJson());
      }
      data['pharmacies'] = arr0;
    }
    return data;
  }
}
