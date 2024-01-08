// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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
          'assets/lottie/background_animation.json',
          alignment: Alignment.topCenter,
          width: screenWidth,
          height: screenHeight * 0.33,
          fit: BoxFit.fill,
        ),
        Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Sajilo Yatayat',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Text('Everything you need for travel',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: screenHeight * 0.09,
                  child: Center(
                    child: InternationalPhoneNumberInput(
                      maxLength: 10,
                      onInputChanged: (PhoneNumber number) {
                        setState(() {
                        });
                      },
                      inputDecoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // BorderRadius of the button
                      ),
                      backgroundColor: green,
                    ),
                    onPressed: () {
                      Get.toNamed('/otp');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(height: 10),
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
                width: screenWidth * 0.8, // Adjust the size as needed
                height: screenWidth * 0.5, // Adjust the size as needed
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: green, // Replace with your desired color
                ),
              ),
            )),
      ],
    );
  }
}
