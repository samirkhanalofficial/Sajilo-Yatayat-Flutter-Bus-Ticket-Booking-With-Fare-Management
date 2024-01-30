// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' show Lottie;
import 'package:get/get.dart';

class verify_otp extends StatelessWidget {
  const verify_otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          verifyotp(),
        ],
      ),
    );
  }
}

class verifyotp extends StatefulWidget {
  const verifyotp({super.key});

  @override
  State<verifyotp> createState() => _verifyotpState();
}

class _verifyotpState extends State<verifyotp> {
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> pinControllers =
        List.generate(6, (index) => TextEditingController());

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    const Color green = Color(0xFF0ACF83);

    return Stack(children: [
      Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Row(children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              Text(
                'Back',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: FractionalTranslation(
                translation: const Offset(0.5, -0.5),
                child: Container(
                  width: screenWidth * 0.9, // Adjust the size as needed
                  height: screenWidth * 0.8, // Adjust the size as needed
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: green, // Replace with your desired color
                  ),
                ))),
      ]),
      Column(
        children: [
          Lottie.asset(
            'asset/animations/otp.json',
            alignment: Alignment.center,
            width: screenWidth * 0.5,
            height: screenWidth * 0.5,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: const Text(
              'Verify',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: const Text(
              'Enter otp:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       child: Text(phoneNumber='', style: TextStyle(color: Colors.black),),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //     width: screenWidth * 0.9,
          //     child: Row(
          //       children: List.generate(
          //         6,
          //         (index) => Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //             child: TextField(
          //                 controller: pinControllers[index],
          //                 keyboardType: TextInputType.number,
          //                 maxLength: 1,
          //                 obscureText: true,
          //                 textAlign: TextAlign.center,
          //                 decoration: InputDecoration(
          //                   contentPadding: const EdgeInsets.all(10),
          //                   counterText: '',
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(20),
          //                   ),
          //                 ),
          //                 onChanged: (String value) {
          //                   if (value.length == 1) {
          //                     if (index < 5) {
          //                       FocusScope.of(context).nextFocus();
          //                     } else {
          //                       // Keep focus on the last TextField until the correct length is reached
          //                       if (pinControllers[5].text.isNotEmpty) {
          //                         FocusScope.of(context).unfocus();
          //                       }
          //                     }
          //                   }
          //                 }),
          //           ),
          //         ),
          //       ),
          //     )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: screenWidth * 0.9,
            height: screenHeight * 0.05,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: green),
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      )
    ]);
  }
}
