import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/models/departure_details.dart';

class SeatBookingPage extends StatefulWidget {
  final DepartureDetails departure;
  const SeatBookingPage({super.key, required this.departure});

  @override
  State<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends State<SeatBookingPage> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Lottie.asset(
              'asset/animations/themeanimation.json',
              width: double.infinity,
              animate: true,
              repeat: true,
            ),
            const SizedBox(
              height: 60,
            ),
            Text('About You', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Let us know more about you.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
