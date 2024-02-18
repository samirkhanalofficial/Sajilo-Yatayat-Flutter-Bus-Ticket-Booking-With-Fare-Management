import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tryapp/ui/pages/registration/arguments/verify_page_argument.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  void login(
    String phoneNumber,
  ) async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+977$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) {
          isLoading.value = false;
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            isLoading.value = false;
            QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.error,
              text: e.message,
            );
          } else {
            isLoading.value = false;
            QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.error,
              title: 'Oops...',
              text: e.message,
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          isLoading.value = false;
          Get.toNamed(
            '/otp-verification',
            arguments: VerifyPageArguments(phoneNumber, verificationId),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      isLoading.value = false;
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: e.toString(),
      );
    }
  }

  void verifyOtpFunction(String otp, String vId) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      isLoading.value = true;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: vId,
        smsCode: otp,
      );
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      User? users = auth.currentUser;
      var token = await users?.getIdToken();
      debugPrint(token);
      Get.offAllNamed(
        '/user-registration',
      );
    } catch (e) {
      Get.snackbar('Error', '$e');
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
