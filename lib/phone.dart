// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class PhoneNumberEntryPage extends StatelessWidget {
  final String role;

  const PhoneNumberEntryPage({super.key, required this.role});

  void next() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          phone_number(),
        ],
      ),
    );
  }
}

class phone_number extends StatefulWidget {
  const phone_number({super.key});

  @override
  State<phone_number> createState() => _phone_numberState();
}

class _phone_numberState extends State<phone_number> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    const Color green = Color(0xFF0ACF83);

    return Column(
      children: [
        Lottie.asset(
          'asset/animations/themeanimation.json',
          alignment: Alignment.topCenter,
          width: screenWidth,
          height: screenHeight * 0.33,
          fit: BoxFit.fill,
        ),
        Text('Sajilo Yatayat', style: Theme.of(context).textTheme.titleLarge),
        Text(
          'Everything you need for travel',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 33,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Mobile Number',
              style: Theme.of(context).textTheme.titleSmall),
        ),
        const SizedBox(
          height: 16,
        ),
        IntlPhoneField(
          decoration: const InputDecoration(
            labelText: 'Phone Number',
          ),
          initialCountryCode: 'NP',
          onChanged: (phone) {
            // print(phone.completeNumber);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/otp');
          },
          child: const Text(
            'Login',
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: RichText(
            text: const TextSpan(
              text: 'By signing in, you accept our ',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'terms & policies.',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: FractionalTranslation(
            translation: const Offset(-0.5, 0.5),
            child: Container(
              width: screenWidth * 1.6, // Adjust the size as needed
              height: screenWidth * 0.6, // Adjust the size as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: green, // Replace with your desired color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
