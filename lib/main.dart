import 'package:flutter/material.dart';
import 'phone.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sajilo Yatayat',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RoleSelectionPage(),
    );
  }
}

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Lottie.asset(
            'assets/background_animation.json',
            alignment: Alignment.topCenter,
            width: screenWidth,
            height: screenHeight * 0.33,
            fit: BoxFit.fill,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sajilo Yatayat',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Everything you need for travel',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              Column(
                children: [
                  SizedBox(
                      width: screenWidth * 0.9,
                      child: const Text(
                        'Choose your role:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // BorderRadius of the button
                          side: const BorderSide(
                              color: Colors.green,
                              width: 2), // Border color and width
                        ),
                      ),
                      onPressed: () {
                        // Navigate to the phone number entry page for passengers
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PhoneNumberEntryPage(role: 'Passenger'),
                          ),
                        );
                      },
                      child: const Text('Passenger',
                          style: TextStyle(color: Colors.green, fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // BorderRadius of the button
                            side: const BorderSide(
                                color: Colors.green,
                                width: 2), // Border color and width
                          ),
                        ),
                        onPressed: () {
                          // Navigate to the phone number entry page for bus owner
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PhoneNumberEntryPage(role: 'Bus Owner'),
                            ),
                          );
                        },
                        child: const Text(
                          'Bus Owner',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: FractionalTranslation(
                        translation: const Offset(-0.5, 0.5),
                        child: Container(
                          width: screenWidth * 0.8, // Adjust the size as needed
                          height:
                              screenWidth * 0.5, // Adjust the size as needed
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Colors.green, // Replace with your desired color
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
