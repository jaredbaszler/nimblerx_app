import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PharmacyDetailScreen extends ConsumerWidget {
  const PharmacyDetailScreen({required this.pharmacyId, Key? key}) : super(key: key);

  final String pharmacyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(pharmacyId);
  }
}
