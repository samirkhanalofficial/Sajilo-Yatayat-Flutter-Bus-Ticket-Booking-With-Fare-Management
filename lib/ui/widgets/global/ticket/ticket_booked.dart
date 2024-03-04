import 'package:flutter/material.dart';
import 'package:tryapp/models/fare_details.dart';

class TicketBooked extends StatelessWidget {
  final FareDetails fareDetails;

  const TicketBooked({super.key, required this.fareDetails});

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
            "${fareDetails.departure.from.name} to ${fareDetails.departure.from.name}",
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
                    "Rs. ${fareDetails.amount}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    fareDetails.bus.busnumber,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Seats: ${fareDetails.seats}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "#${fareDetails.id}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fareDetails.status,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    fareDetails.departure.time,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    fareDetails.departure.date,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.document_scanner_outlined),
                label: const Text(
                  'Show QR',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text(
                  'Call',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
