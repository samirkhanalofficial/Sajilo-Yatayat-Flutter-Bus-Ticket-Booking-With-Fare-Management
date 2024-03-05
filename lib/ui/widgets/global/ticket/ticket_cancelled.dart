import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/models/fare_details.dart';
import 'package:tryapp/ui/pages/bus/seats/pay_fare_bottom_sheet.dart';

class TicketCancelled extends StatefulWidget {
  final FareDetails fareDetails;
  final Function onCancel;

  const TicketCancelled({
    super.key,
    required this.fareDetails,
    required this.onCancel,
  });

  @override
  State<TicketCancelled> createState() => _TicketCancelledState();
}

class _TicketCancelledState extends State<TicketCancelled> {
  UserController userController = (UserController());
  @override
  void initState() {
    userController.isPassenger();
    super.initState();
  }

  @override
  void dispose() {
    userController.dispose();
    super.dispose();
  }

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
            "${widget.fareDetails.departure.from.name} to ${widget.fareDetails.departure.to.name}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.fareDetails.amount.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    widget.fareDetails.bus.busnumber,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Seats: ${widget.fareDetails.seats} ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.fareDetails.status,
                    style: TextStyle(
                        fontSize: 14,
                        color: widget.fareDetails.status == 'ACCEPTED'
                            ? const Color(0xFFC4C816)
                            : Colors.red),
                  ),
                  Text(
                    widget.fareDetails.departure.time,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    widget.fareDetails.departure.date,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            '#${widget.fareDetails.id}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          widget.fareDetails.status == 'ACCEPTED'
              ? Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      !userController.isPassengerCheck.value
                          ? const SizedBox.shrink()
                          : TextButton.icon(
                              onPressed: () {
                                Get.bottomSheet(
                                  PayFareBottomSheet(
                                    fareDetails: widget.fareDetails,
                                  ),
                                  enableDrag: true,
                                  isScrollControlled: true,
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
                              icon: const Icon(Icons.payment),
                              label: const Text('PayNow'),
                            ),
                      TextButton.icon(
                        onPressed: () {
                          widget.onCancel();
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
