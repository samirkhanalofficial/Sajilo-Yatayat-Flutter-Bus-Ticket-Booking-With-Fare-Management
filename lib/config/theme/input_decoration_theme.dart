import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationThemeData() {
  return InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w200,
      color: Color.fromRGBO(120, 120, 120, 1),
    ),
    labelStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(25, 24, 24, 1),
    ),
    filled: true,
    fillColor: const Color.fromRGBO(241, 240, 238, 1),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
            Radius.circular(16)) // No visible border when not focused
        ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16), // Adjust the radius as needed
    ),
  );
}
