import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimblerx_app/presentation/screens/home_screen.dart';
import 'package:nimblerx_app/utils/extensions.dart';

void main() {
  runApp(const ProviderScope(child: NimbleRxApp()));
}

class NimbleRxApp extends StatelessWidget {
  const NimbleRxApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const Color(0xFF01769d).toMaterialColor(),
      ),
      home: const HomeScreen(),
    );
  }
}
