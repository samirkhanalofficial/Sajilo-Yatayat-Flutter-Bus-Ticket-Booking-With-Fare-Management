import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FareSentCard extends StatelessWidget {
  const FareSentCard({super.key});

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'asset/animations/done.json',
            width: double.infinity,
            animate: true,
            repeat: false,
            height: 200,
          ),
          Text(
            'Your amount is in hold, will be returned if fare is rejected.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("View Fares"),
          )
        ],
      ),
    );
  }
}
