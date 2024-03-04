import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/fare_controller.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_bargain.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_booked.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_cancelled.dart';

class OwnerBookingDetailsPage extends StatefulWidget {
  const OwnerBookingDetailsPage({super.key});

  @override
  State<OwnerBookingDetailsPage> createState() =>
      _UserBookingDetailsPageState();
}

class _UserBookingDetailsPageState extends State<OwnerBookingDetailsPage> {
  final FareController fareController = (FareController());
  @override
  void initState() {
    fareController.getBusFares();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.all(13.0),
            children: [
              Row(
                children: [
                  Image.asset(
                    'asset/images/g-icon.png',
                    width: 45,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Bookings',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('This is the list of your bookings.',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              if (fareController.isLoading.value)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              if (!fareController.isLoading.value)
                ...fareController.fares.map(
                  (fareData) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: fareData.status == 'PAID'
                        ? TicketBooked(
                            fareDetails: fareData,
                          )
                        : fareData.status == 'CANCELLED' ||
                                fareData.status == 'ACCEPTED' ||
                                fareData.status == 'REJECTED'
                            ? TicketCancelled(
                                fareDetails: fareData,
                              )
                            : TicketBargan(
                                fareDetails: fareData,
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
