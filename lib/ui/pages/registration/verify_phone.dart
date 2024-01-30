import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:tryapp/ui/pages/registration/verify_otp.dart';
import 'package:tryapp/ui/widgets/global/phone_input.dart';

class VerifyPhoneNumber extends StatelessWidget {
  const VerifyPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: -90,
            left: -100,
            child: Hero(
              tag: 'circle',
              child: Container(
                width: 330,
                height: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Lottie.asset(
                  'asset/animations/themeanimation.json',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  animate: true,
                  repeat: true,
                ),
                Text('Sajilo Yatayat',
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'Everything you need for Travel.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 33,
                ),
                Text('Mobile Number',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(
                  height: 16,
                ),
                const NepalFlagInputField(),
                const SizedBox(
                  height: 19,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      const LoginPage(),
                    );
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 19,
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
