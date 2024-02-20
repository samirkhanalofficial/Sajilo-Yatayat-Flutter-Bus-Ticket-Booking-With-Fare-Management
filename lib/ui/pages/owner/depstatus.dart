import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:tryapp/config/routes/routes_names.dart';


class bus_departure extends StatelessWidget {
  const bus_departure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [const departure()],
      ),
    );
  }
}

class departure extends StatefulWidget {
  const departure({super.key});

  @override
  State<departure> createState() => _departureState();
}

class _departureState extends State<departure> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('< Back'),
                    ),
                  ],
                ),
                Lottie.asset(
                  'asset/animations/themeanimation.json',
                  alignment: Alignment.topCenter,
                  width: screenWidth,
                  height: screenHeight * 0.33,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child:
              const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "My Departures",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "See available seats by clicking it",
                  style: TextStyle(fontSize: 10),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sajilo Yatayat(AC Deluxe)"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rs.2000",
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "asset/images/star.png",
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("5.0"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Image.asset(
                            "asset/images/wifi.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/AC.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/food.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/bathroom.png",
                          ),
                        ]),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("12:00 AM"),
                            Text(
                              "1st Jan,2024",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        )
                      ],
                    ),
                    const Text(
                      "Kathmandu to Pokhara",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sajilo Yatayat(AC Deluxe)"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rs.2000",
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "asset/images/star.png",
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("5.0"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Image.asset(
                            "asset/images/wifi.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/AC.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/food.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/bathroom.png",
                          ),
                        ]),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("12:00 AM"),
                            Text(
                              "1st Jan,2024",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        )
                      ],
                    ),
                    const Text(
                      "Kathmandu to Pokhara",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sajilo Yatayat(AC Deluxe)"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rs.2000",
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "asset/images/star.png",
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("5.0"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Image.asset(
                            "asset/images/wifi.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/AC.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/food.png",
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "asset/images/bathroom.png",
                          ),
                        ]),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("12:00 AM"),
                            Text(
                              "1st Jan,2024",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        )
                      ],
                    ),
                    const Text(
                      "Kathmandu to Pokhara",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
