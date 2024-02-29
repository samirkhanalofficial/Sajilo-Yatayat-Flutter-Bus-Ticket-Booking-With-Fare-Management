import 'package:flutter/material.dart';

class TicketBargan extends StatelessWidget {
  const TicketBargan({super.key});

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
            "#fauwebfyu632bajfhadhfhj",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Jaleshwor to Kathmandu",
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
                    "Rs. 1500",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "BA 2 kha 2567 ",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Seats: A5 ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fare",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    "10:15 PM",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "2023-03-15 ",
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
              TextButton(
                onPressed: () {},
                child: const Text("Accept"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Propose New Fare",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
