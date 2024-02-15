import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tryapp/ui/pages/registration/login_page.dart';


class LoginFucntions extends GetxController {
  var isLoading = false.obs;
  void login(
    TextEditingController phoneNumberData,
  ) async {
    try {
      isLoading(true);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+977${phoneNumberData.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid');
            isLoading(false);
          } else {
            Get.snackbar('Error', '${e.message}');
            isLoading(false);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          LoginPage.verify = verificationId;
          Get.toNamed(
            '/otp-verification',
            arguments: phoneNumberData.text,
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Get.snackbar('Error', '$e');

      isLoading(false);
    }
  }
}
