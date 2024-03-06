import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/fare_controller.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_bargain.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_booked.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_cancelled.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_completed.dart';
import 'package:tryapp/ui/widgets/global/wallet/bargain_current_fare_card.dart';

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
    fareController.getBusFares(shouldReload: true);
    super.initState();
  }

  @override
  void dispose() {
    fareController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: () => fareController.getBusFares(),
            child: ListView(
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
                if (!fareController.isLoading.value &&
                    fareController.fares.isEmpty)
                  Center(
                    child: Image.asset(
                      'asset/images/nodata.png',
                      width: 150,
                    ),
                  ),
                if (!fareController.isLoading.value)
                  ...fareController.fares.map(
                    (fareData) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: fareData.status == 'COMPLETED'
                          ? TicketCompleted(fareDetails: fareData)
                          : fareData.status == 'PAID'
                              ? TicketBooked(
                                  fareDetails: fareData,
                                  onCancel: () =>
                                      fareController.cancelFare(fareData.id),
                                )
                              : fareData.status == 'CANCELLED' ||
                                      fareData.status == 'ACCEPTED' ||
                                      fareData.status == 'REJECTED'
                                  ? TicketCancelled(
                                      fareDetails: fareData,
                                      onCancel: () => fareController
                                          .cancelFare(fareData.id),
                                    )
                                  : TicketBargan(
                                      fareDetails: fareData,
                                      onAccept: () => fareController
                                          .acceptFare(fareData.id),
                                      onReject: () => fareController
                                          .rejectFare(fareData.id),
                                      onCancel: () => fareController
                                          .cancelFare(fareData.id),
                                      onProposeNewFare: () {
                                        Get.bottomSheet(BargainFairCard(
                                          fareDetails: fareData,
                                          fareController: fareController,
                                        ));
                                      }

                                      //     // fareController.changePriceAndOfferFare(),
                                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
