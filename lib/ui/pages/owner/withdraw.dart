import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/config/routes/routes_names.dart';

class withdraw extends StatelessWidget {
  const withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: Text(
              "Welcome,",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
            child: Text(
              "Ritesh",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            height: screenHeight,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Withdraw',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text('We will load money to this bank account.',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Amount(Rs.)',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(hintText: '999'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Full Name in Bank',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'Ritesh Karmacharya'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Bank Name',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'Nepal Bank Limited'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Bank Account Number',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'XXXXXXXXXXXXXXXX'),
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutesNames.otpVerificationPage);
                  },
                  child: const Text('Withdraw'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
