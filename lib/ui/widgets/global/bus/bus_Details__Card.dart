import 'package:flutter/material.dart';

class BusDetailsCard extends StatelessWidget {
  const BusDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jaleshwor to Kathmandu",
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
                    "Rs. 1500",
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
                    "10:15 PM",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "BA 2 kha 2567 ",
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
    );
  }
}
