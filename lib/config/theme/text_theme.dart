import 'package:flutter/material.dart';

TextTheme textThemeData() {
  return const TextTheme(
    titleLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      fontFamily: 'Righteous',
    ),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400), //for welcome text i.e Welcome
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ), //user profile name
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.red), //red text
    labelSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(10, 207, 131, 1),
    ), //green text
  );
}
