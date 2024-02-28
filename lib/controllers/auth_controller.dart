import 'package:quickalert/quickalert.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/ui/pages/registration/arguments/verify_page_argument.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  void login(
    String phoneNumber,
  ) async {
    isLoading.value = true;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+977$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {
        isLoading.value = false;
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading.value = false;
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          title: 'Invalid phone number',
          text: e.message.toString(),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        isLoading.value = false;
        Get.toNamed(
          RoutesNames.otpVerificationPage,
          arguments: VerifyPageArguments(phoneNumber, verificationId),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOtp(String otp, String vId) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      isLoading.value = true;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: vId,
        smsCode: otp,
      );
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      UserController userController = UserController();
      bool userExists = await userController.userExists();
      if (!userExists) {
        Get.offAllNamed(
          RoutesNames.userRegistrationPage,
        );
      } else {
        SharedPreferences sf = await SharedPreferences.getInstance();
        sf.setBool("isLogginned", true);
        Get.offAllNamed(
          RoutesNames.userHomePage,
        );
      }
    } catch (e) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Incorrect OTP',
        text: 'Please check your sms and enter the correct OTP code',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
