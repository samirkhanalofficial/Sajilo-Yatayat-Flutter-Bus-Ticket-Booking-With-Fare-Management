import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textThemeData() {
  return TextTheme(
    titleLarge: GoogleFonts.righteous(
      fontSize: 35,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    bodyLarge: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400), //for welcome text i.e Welcome
    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ), //user profile name
    bodySmall: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.red), //red text
    labelSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(10, 207, 131, 1),
    ), //green text
  );
}
