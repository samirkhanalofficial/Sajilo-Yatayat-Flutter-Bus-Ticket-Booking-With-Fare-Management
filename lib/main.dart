import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryapp/config/theme/elevated_button_theme.dart';
import 'package:tryapp/config/theme/input_decoration_theme.dart';
import 'package:tryapp/config/routes/app_routes.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/config/theme/text_theme.dart';
import 'package:tryapp/ui/pages/registration/verify_phone.dart';

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
      initialRoute: RoutesNames.homePage,
      getPages: appRoutes,
      title: 'Sajilo Yatatt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0ACF83),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0ACF83),
          primary: const Color(0xFF0ACF83),
        ),
        textTheme: GoogleFonts.robotoTextTheme(textThemeData()),
        elevatedButtonTheme: elevatedButtonThemeData(),
        inputDecorationTheme: inputDecorationThemeData(),
        useMaterial3: false,
      ),
    );
  }
}
