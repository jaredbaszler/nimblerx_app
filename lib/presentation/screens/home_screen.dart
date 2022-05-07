import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimblerx_app/data/models/pharmacy_list.dart';
import 'package:nimblerx_app/presentation/providers/home_provider.dart';
import 'package:nimblerx_app/presentation/screens/pharmacy_detail_screen.dart';
import 'package:nimblerx_app/presentation/widgets/nimble_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pharmacyList = ref.watch(pharmacyListProvider);

    return pharmacyList.when(
      data: (data) => buildPage(buildContext: context, widgetRef: ref, pharmacies: data),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, st) => kDebugMode
          ? Text('Error retrieving the pharmacy list: ${error.toString()}; Stack Trace: $st')
          : const Text('An error occurred while retrieving the pharmacy list.'),
    );
  }

  void navigateToDetailsPage({required BuildContext context, required String pharmacyId}) {}

  Widget buildPage({
    required BuildContext buildContext,
    required WidgetRef widgetRef,
    required List<PharmacyListPharmacies?> pharmacies,
  }) {
    return Scaffold(
      appBar: const NimbleAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: pharmacies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) =>
                          PharmacyDetailScreen(pharmacyId: pharmacies[index]?.pharmacyId ?? ''),
                    ),
                  ),
                  child: ListTile(
                    // TODO: add leading to hold green ordered from checkbox
                    title: Text(
                      pharmacies[index]?.name ?? '',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 2,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => debugPrint('order button'),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  'Order From Nearest Pharmacy',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
