import 'package:flutter/material.dart';

class CurrentFairCard extends StatelessWidget {
  const CurrentFairCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13.0),
      height: 450,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(58),
          topRight: Radius.circular(58),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 38,
          ),
          Text("Current \nSent", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 33,
          ),
          Text("Bus owner: 5000", style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 33,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Fare',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: '4000',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Send Fair"),
          )
        ],
      ),
    );
  }
}
