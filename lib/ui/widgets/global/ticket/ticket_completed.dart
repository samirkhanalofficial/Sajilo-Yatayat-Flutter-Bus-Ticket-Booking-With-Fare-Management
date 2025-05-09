import 'package:flutter/material.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/models/fare_details.dart';

class TicketCompleted extends StatefulWidget {
  final FareDetails fareDetails;

  const TicketCompleted({
    super.key,
    required this.fareDetails,
  });

  @override
  State<TicketCompleted> createState() => _TicketCompletedState();
}

class _TicketCompletedState extends State<TicketCompleted> {
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
                    "${widget.fareDetails.amount.toString()} ( ${widget.fareDetails.faredBy.name} ) ",
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
                    style: const TextStyle(fontSize: 14, color: Colors.green),
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
        ],
      ),
    );
  }
}
