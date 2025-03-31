import 'package:flutter/material.dart';
import 'widgets/home_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Boldonse"),
      home: HomeTextWidget(),
    );
  }
}
