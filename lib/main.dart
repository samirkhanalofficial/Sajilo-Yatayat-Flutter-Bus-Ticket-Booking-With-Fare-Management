import 'package:flutter/material.dart';
import 'package:tryapp/roleselection.dart';
import 'package:tryapp/verify_otp.dart';
import 'phone.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const RoleSelectionPage()),
        GetPage(
            name: '/phone',
            page: () => const PhoneNumberEntryPage(role: 'Passenger')),
        GetPage(
            name: '/phone',
            page: () => const PhoneNumberEntryPage(role: 'Owner')),
        GetPage(
            name: '/otp',
            page: () => const verifyotp()),
        // GetPage(name: '/register', page: ()=> register()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Sajilo Yatayat',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
