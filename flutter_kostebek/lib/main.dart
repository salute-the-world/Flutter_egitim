import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kostebek/kostebegi_yakala.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Köstebeği yakala',
      home: KostebegiYakala(),
      debugShowCheckedModeBanner: false,
      theme: _customTheme(),
    );
  }

  ThemeData _customTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light),
    );
  }
}
