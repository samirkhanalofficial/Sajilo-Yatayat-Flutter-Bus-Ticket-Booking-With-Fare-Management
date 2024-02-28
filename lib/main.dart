import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryapp/config/colors/app_color.dart';
import 'package:tryapp/config/theme/elevated_button_theme.dart';
import 'package:tryapp/config/theme/input_decoration_theme.dart';
import 'package:tryapp/config/routes/app_routes.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/config/theme/text_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RoutesNames.homePage,
      getPages: appRoutes,
      title: 'Sajilo Yatatt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor().primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor().primary,
          primary: AppColor().primary,
        ),
        textTheme: GoogleFonts.robotoTextTheme(textThemeData()),
        elevatedButtonTheme: elevatedButtonThemeData(),
        inputDecorationTheme: inputDecorationThemeData(),
        useMaterial3: false,
      ),
    );
  }
}
