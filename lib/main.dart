import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimblerx_app/presentation/screens/home_screen.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
