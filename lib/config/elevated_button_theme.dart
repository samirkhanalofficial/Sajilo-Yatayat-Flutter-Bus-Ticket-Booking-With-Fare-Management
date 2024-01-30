import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size(double.infinity, 50.0),
      ),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    ),
  );
}
