import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/config/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLogin() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    bool isLogginned = sf.getBool("isLogginned") ?? false;
    if (isLogginned) {
      Get.offAllNamed(
        RoutesNames.userHomePage,
      );
    } else {
      Get.offAllNamed(
        RoutesNames.roleSelectionPage,
      );
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset("asset/images/logo.png")),
      ),
    );
  }
}
