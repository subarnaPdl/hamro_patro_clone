import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/presentation/screens/home_screen.dart';
import 'package:hamro_patro_clone/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hamro Patro Clone',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
