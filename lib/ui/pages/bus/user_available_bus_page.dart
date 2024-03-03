import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:tryapp/controllers/departure_controller.dart';

import 'package:tryapp/ui/widgets/global/bus/bus_details_card.dart';

class UserAvailableBusPage extends StatefulWidget {
  final String date;
  final String fromID;
  final String toID;

  const UserAvailableBusPage(
      {super.key,
      required this.date,
      required this.fromID,
      required this.toID});

  @override
  State<UserAvailableBusPage> createState() => _AvilableBusPageState();
}

class _AvilableBusPageState extends State<UserAvailableBusPage> {
  final DepartureController departureController =
      Get.put(DepartureController());

  @override
  void initState() {
    departureController.getAllDepartures(
        widget.date, widget.fromID, widget.toID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.all(13),
            children: [
              Lottie.asset(
                'asset/animations/themeanimation.json',
                width: double.infinity,
                fit: BoxFit.cover,
                animate: true,
                repeat: true,
              ),
              Text('Available Bus',
                  style: Theme.of(context).textTheme.titleLarge),
              Text(
                'Choose buses from available bus.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 40,
              ),
              ...departureController.departures.map(
                (departureData) => Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: BusDetailsCard(
                    departureDetails: departureData,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
