import 'package:flutter/material.dart';
import 'package:tryapp/ui/widgets/global/payment/wallet_transaction_card.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(13.0),
        children: [
          Text(
            'Welcome,',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text('Sumit Ray', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                'asset/images/g-icon.png',
                width: 45,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Transaction History',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('This is the history of your trasnsition',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const WalletTransactionCard(),
          const SizedBox(
            height: 25,
          ),
          const WalletTransactionCard()
        ],
      ),
    ));
  }
}
