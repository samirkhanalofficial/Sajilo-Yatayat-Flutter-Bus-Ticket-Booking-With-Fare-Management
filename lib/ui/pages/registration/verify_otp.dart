import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:tryapp/controllers/auth_controller.dart';
import 'package:tryapp/ui/pages/registration/arguments/verify_page_argument.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final otp = TextEditingController();
  VerifyPageArguments verifyPageArguments = Get.arguments;
  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController loginController = Get.put(AuthController());

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 55,
      textStyle: const TextStyle(
          fontSize: 20, color: Color(0xFF0ACF83), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F0EE),
        border: Border.all(
          color: const Color(0xFFF1F0EE),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(16),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xFFF1F0EE),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -90,
            right: -100,
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
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('< Back'),
                    ),
                  ),
                  const SizedBox(
                    height: 180,
                  ),
                  Lottie.asset(
                    'asset/animations/otp.json',
                    height: MediaQuery.of(context).size.height * 0.22,
                    animate: true,
                    repeat: true,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text('Verify', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Enter the otp sent to your mobile',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '+977 ${verifyPageArguments.phoneNumber}',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    length: 6,
                    controller: otp,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Obx(
                    () => LoadingButton(
                      onClick: () => loginController.verifyOtpFunction(
                          otp.text, verifyPageArguments.vId),
                      buttonName: "Verify",
                      loading: loginController.isLoading.value,
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
