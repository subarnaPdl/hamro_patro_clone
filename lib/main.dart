import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';
import 'package:hamro_patro_clone/presentation/screens/home_screen.dart';
import 'package:hamro_patro_clone/data/models/theme_mode.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) => Consumer<ThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Hamro Patro Clone',
            debugShowCheckedModeBanner: false,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            // themeMode: ThemeMode.dark,
            themeMode: themeData.themeMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
