import 'package:flutter/material.dart';
import 'package:tryapp/models/fare_details.dart';

class TicketCancelled extends StatelessWidget {
  final FareDetails fareDetails;
  final Function onCancel;
  const TicketCancelled(
      {super.key, required this.fareDetails, required this.onCancel});

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
            "${fareDetails.departure.from.name} to ${fareDetails.departure.to.name}",
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
                    fareDetails.amount.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    fareDetails.bus.busnumber,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Seats: ${fareDetails.seats} ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fareDetails.status,
                    style: TextStyle(
                        fontSize: 14,
                        color: fareDetails.status == 'ACCEPTED'
                            ? const Color(0xFFC4C816)
                            : Colors.red),
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
          Text(
            '#${fareDetails.id}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          fareDetails.status == 'ACCEPTED'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.payment),
                      label: const Text('PayNow'),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        onCancel();
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
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
