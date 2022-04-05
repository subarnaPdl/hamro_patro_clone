import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  //-------------light THEME SETTINGS----
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.grey,
    primaryColor: const Color(0xFFb71c1c),
    textTheme: TextTheme(
      headline1: GoogleFonts.mulish(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
      headline6: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF606060)),
    cardColor: Colors.grey[50],
    bannerTheme:
        const MaterialBannerThemeData(backgroundColor: Color(0xFFe2e2e2)),
    highlightColor: Colors.orange[50],
  );

  //-------------DARK THEME SETTINGS----
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF333336),
    shadowColor: Colors.black54,
    primaryColor: Colors.black,
    textTheme: TextTheme(
      headline1: GoogleFonts.mulish(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
      headline6: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFc2c2c2)),
    cardColor: const Color(0xFF2c2c2c),
    bannerTheme: const MaterialBannerThemeData(backgroundColor: Colors.black54),
    highlightColor: const Color(0xFF222323),
  );
}
