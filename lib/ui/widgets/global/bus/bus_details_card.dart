import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/models/departure_details.dart';
import 'package:tryapp/ui/pages/bus/seats/seat_booking_page.dart';

class BusDetailsCard extends StatelessWidget {
  final DepartureDetails departureDetails;
  const BusDetailsCard({super.key, required this.departureDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(() => SeatBookingPage(departure: departureDetails));
          },
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${departureDetails.from.name} to ${departureDetails.to.name}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rs. ${departureDetails.amount}",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.wifi,
                              size: 32,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.tv,
                              size: 32,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.wind_power_rounded,
                              size: 32,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.star_border_purple500_sharp,
                              size: 32,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("3.5"),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          departureDetails.time,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          departureDetails.bus.busnumber,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
