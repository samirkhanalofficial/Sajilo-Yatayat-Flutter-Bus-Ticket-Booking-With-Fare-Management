import 'package:flutter/material.dart';
import 'package:tryapp/phone.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialRoute: '/',
//       getPages: [
//         // GetPage(name: '/', page: () => const RoleSelectionPage()),
//         GetPage(
//           name: '/phone',
//           page: () => const PhoneNumberEntryPage(role: 'Passenger'),
//         ),
//         GetPage(
//           name: '/phone',
//           page: () => const PhoneNumberEntryPage(role: 'Owner'),
//         ),
//         GetPage(
//           name: '/otp',
//           page: () => const verifyotp(),
//         ),
//         // GetPage(name: '/register', page: ()=> register()),
//       ],
//       debugShowCheckedModeBanner: false,
//       title: 'Sajilo Yatayat',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sajilo Yatatt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(10, 207, 131, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(10, 207, 131, 1),
          primary: const Color.fromRGBO(10, 207, 131, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400), //for welcome text i.e Welcome
          bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(183, 181, 181, 1)), //user profile name
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
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
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
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color.fromRGBO(241, 240, 238, 1),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                  Radius.circular(16)) // No visible border when not focused
              ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(16), // Adjust the radius as needed
          ),
        ),
        useMaterial3: false,
      ),
      home: const PhoneNumberEntryPage(
        role: 'Passenger',
      ),
    );
  }
}
