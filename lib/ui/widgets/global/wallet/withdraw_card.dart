import 'package:flutter/material.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class WithdrawCard extends StatelessWidget {
  const WithdrawCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(58),
          topRight: Radius.circular(58),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text("Withdraw", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 5,
          ),
          Text(
            'We will load money to this bank account. This action may take a working day.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Amount (Rs)', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: '956',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Account Name', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Sumit Ray',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Bank Name', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'NIC ASIA MOBANK',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Bank Account Number',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: '012567154321076',
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          LoadingButton(onClick: () {}, buttonName: 'Withdraw')
        ],
      ),
    );
  }
}
