import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/ui/pages/registration/login_page.dart';
import 'package:tryapp/ui/pages/registration/verify_otp.dart';

void loginFucntion(TextEditingController phoneNumberData) async {
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+977${phoneNumberData.text}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        LoginPage.verify = verificationId;
        Get.to(
          () => const VerifyOTP(),
          duration: const Duration(milliseconds: 800),
          arguments: phoneNumberData.text,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } catch (e) {
    Get.snackbar('Error', '$e');
  }
}
