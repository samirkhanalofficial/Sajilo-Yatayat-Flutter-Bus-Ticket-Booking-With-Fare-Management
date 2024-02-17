import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/get_header.dart';
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
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid');
          } else {
            Get.snackbar('Error', '${e.message}');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.toNamed(
            '/otp-verification',
            arguments: VerifyPageArguments(phoneNumber, verificationId),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Get.snackbar('Error', '$e');
    } finally {
      isLoading.value = false;
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
      Get.toNamed(
        '/user-registration',
        arguments: token,
      );
    } catch (e) {
      Get.snackbar('Error', '$e');
    } finally {
      isLoading.value;
    }
  }

  void getUserProfile() async {
    try {
      var response = await Dio().get(
        getUserDetails,
        options: await getHeader(),
      );
      if (response.statusCode == 200) {
      } else {
        Get.snackbar('${response.statusCode}', '${response.statusMessage}');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
