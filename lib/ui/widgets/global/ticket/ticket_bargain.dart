import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/models/fare_details.dart';

class TicketBargan extends StatefulWidget {
  final FareDetails fareDetails;
  final Function onAccept;
  final Function onReject;
  final Function onCancel;
  final Function onProposeNewFare;

  const TicketBargan({
    super.key,
    required this.fareDetails,
    required this.onAccept,
    required this.onReject,
    required this.onCancel,
    required this.onProposeNewFare,
  });

  @override
  State<TicketBargan> createState() => _TicketBarganState();
}

class _TicketBarganState extends State<TicketBargan> {
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
    return Obx(
      () => userController.isLoading.value
          ? const SizedBox.shrink()
          : Container(
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
                            "Rs. ${widget.fareDetails.amount} ( ${widget.fareDetails.faredBy.name} ) ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            widget.fareDetails.departure.bus.busnumber,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "Seats:${widget.fareDetails.seats}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "#${widget.fareDetails.id}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.fareDetails.status,
                            style: Theme.of(context).textTheme.labelSmall,
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
                  if ((widget.fareDetails.isFaredByUser &&
                          !userController.isPassengerCheck.value) ||
                      (!widget.fareDetails.isFaredByUser &&
                          userController.isPassengerCheck.value))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              widget.onAccept();
                            },
                            child: const Text("Accept")),
                        TextButton(
                          onPressed: () {
                            widget.onProposeNewFare();
                          },
                          child: const Text(
                            "Propose New Fare",
                            style: TextStyle(color: Color(0xFFC4C816)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            widget.onReject();
                          },
                          child: const Text(
                            "Reject Fare",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  if ((widget.fareDetails.isFaredByUser &&
                          userController.isPassengerCheck.value) ||
                      (!widget.fareDetails.isFaredByUser &&
                          !userController.isPassengerCheck.value))
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
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
                    ),
                ],
              ),
            ),
    );
  }
}
