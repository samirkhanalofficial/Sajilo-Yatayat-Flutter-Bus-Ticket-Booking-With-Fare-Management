import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tryapp/config/elevated_button_theme.dart';
import 'package:tryapp/config/input_decoration_theme.dart';
import 'package:tryapp/config/text_theme.dart';
import 'package:tryapp/ui/pages/global/verify_phone.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const VerifyPhoneNumber(),
        )
      ],
      title: 'Sajilo Yatatt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(10, 207, 131, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(10, 207, 131, 1),
          primary: const Color.fromRGBO(10, 207, 131, 1),
        ),
        textTheme: textThemeData(),
        elevatedButtonTheme: elevatedButtonThemeData(),
        inputDecorationTheme: inputDecorationThemeData(),
        useMaterial3: false,
      ),
      home: const VerifyPhoneNumber(),
    );
  }
}
