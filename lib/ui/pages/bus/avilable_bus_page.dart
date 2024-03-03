import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:tryapp/controllers/departure_controller.dart';
import 'package:tryapp/ui/widgets/global/bus/bus_details_card.dart';

class AvilableBusPage extends StatefulWidget {
  const AvilableBusPage({super.key});

  @override
  State<AvilableBusPage> createState() => _AvilableBusPageState();
}

class _AvilableBusPageState extends State<AvilableBusPage> {
  final DepartureController departureController =
      Get.put(DepartureController());

  @override
  void initState() {
    departureController.getBusDepartures();
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
              Text('My Departures',
                  style: Theme.of(context).textTheme.titleLarge),
              Text(
                'See available seats by clicking it.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 40,
              ),
              ...departureController.departures.map(
                (busData) => InkWell(
                  onTap: () {},
                  child: BusDetailsCard(
                    from: busData.from.name,
                    to: busData.to.name,
                    price: busData.amount,
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
