import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/config/colors/app_color.dart';
import 'package:tryapp/controllers/departure_controller.dart';
import 'package:tryapp/controllers/fare_controller.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/models/departure_details.dart';
import 'package:tryapp/ui/pages/bus/seats/fare_bottom_sheet.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class SeatBookingPage extends StatefulWidget {
  final DepartureDetails departure;
  const SeatBookingPage({super.key, required this.departure});

  @override
  State<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends State<SeatBookingPage> {
  UserController userController = UserController();
  DepartureController departureController = DepartureController();
  FareController fareController = FareController();

  @override
  void initState() {
    userController.isPassenger();
    departureController.getBookedSeatsByDepartureId(widget.departure.id);
    super.initState();
  }

  @override
  void dispose() {
    userController.dispose();
    departureController.dispose();
    fareController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
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
            Text('Booked Seat', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 8,
            ),
            Text(
              'See the list of the booked seats.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => departureController.isLoading.value
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Side A",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    children: [
                                      for (int i = 1;
                                          i <= widget.departure.bus.leftSeats;
                                          i++)
                                        SeatButton(
                                            departureController:
                                                departureController,
                                            i: i)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Side B",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  GridView.count(
                                    crossAxisCount: 2,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      for (int i =
                                              widget.departure.bus.leftSeats +
                                                  1;
                                          i <=
                                              widget.departure.bus.leftSeats +
                                                  widget
                                                      .departure.bus.rightSeats;
                                          i++)
                                        SeatButton(
                                            departureController:
                                                departureController,
                                            i: i)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Last Seats",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: widget.departure.bus.lastSeats,
                          shrinkWrap: true,
                          children: [
                            for (int i = widget.departure.bus.leftSeats +
                                    1 +
                                    widget.departure.bus.rightSeats;
                                i <=
                                    widget.departure.bus.leftSeats +
                                        widget.departure.bus.rightSeats +
                                        widget.departure.bus.lastSeats;
                                i++)
                              SeatButton(
                                  departureController: departureController,
                                  i: i)
                          ],
                        ),
                      ],
                    ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chair,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "Available",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chair,
                        color: AppColor().primary,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "Selected",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chair,
                        size: 35,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "Booked",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Rate: Rs. ${widget.departure.amount}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => userController.isPassengerCheck.value
                    ? LoadingButton(
                        onClick: departureController.selectedSeats.length *
                                    widget.departure.amount <=
                                0
                            ? null
                            : () async {
                                Get.bottomSheet(
                                  FareBottomSheet(
                                    departure: widget.departure,
                                    departureController: departureController,
                                    fareController: fareController,
                                  ),
                                  elevation: 2,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                );
                              },
                        buttonName:
                            "Book @ Rs. ${departureController.selectedSeats.length * widget.departure.amount}",
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class SeatButton extends StatelessWidget {
  const SeatButton({
    super.key,
    required this.departureController,
    required this.i,
  });

  final DepartureController departureController;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: Icon(
          Icons.chair,
          size: 35,
          color: departureController.bookedSeats.contains(i)
              ? Colors.red
              : departureController.selectedSeats.contains(i)
                  ? AppColor().primary
                  : Colors.black,
        ),
        onPressed: departureController.bookedSeats.contains(i)
            ? null
            : () {
                if (departureController.selectedSeats.contains(i)) {
                  departureController.selectedSeats
                      .removeWhere((element) => element == i);
                } else {
                  departureController.selectedSeats.add(i);
                }
              },
      ),
    );
  }
}
