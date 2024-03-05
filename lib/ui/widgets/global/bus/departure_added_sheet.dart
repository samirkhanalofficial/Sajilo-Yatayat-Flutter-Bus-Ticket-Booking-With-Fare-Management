import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/ui/pages/booking/user_booking_details_page.dart';

class DepartureAdded extends StatelessWidget {
  const DepartureAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(13.0),
          height: 450,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(58),
              topRight: Radius.circular(58),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Departure  Added ",
                style: TextStyle(
                    fontSize: 45, height: 1, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              Lottie.asset(
                'asset/animations/done.json',
                width: double.infinity,
                animate: true,
                repeat: false,
                height: 200,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const UserBookingDetailsPage());
                },
                child: const Text("View Your Departures"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
