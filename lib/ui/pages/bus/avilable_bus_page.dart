import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/ui/widgets/global/bus/bus_details__card.dart';

class AvilableBusPage extends StatelessWidget {
  const AvilableBusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
            const BusDetailsCard(),
            const SizedBox(
              height: 22,
            ),
            const BusDetailsCard(),
            const SizedBox(
              height: 22,
            ),
            const BusDetailsCard(),
          ],
        ),
      ),
    );
  }
}
