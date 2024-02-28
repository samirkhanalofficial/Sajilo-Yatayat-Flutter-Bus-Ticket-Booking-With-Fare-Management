import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/controllers/auth_controller.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';
import 'package:tryapp/ui/widgets/global/phone_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberData = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberData.dispose();
    super.dispose();
  }

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
                Center(
                  child: Text('Sajilo Yatayat',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Center(
                  child: Text(
                    'Everything you need for Travel.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Text('Mobile Number',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: NepalFlagInputField(
                    phoneNumberData: phoneNumberData,
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(
                    () => LoadingButton(
                      onClick: () => authController.login(phoneNumberData.text),
                      buttonName: 'Login',
                      loading: authController.isLoading.value,
                    ),
                  ),
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
