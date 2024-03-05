import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/transaction_controller.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class WithdrawCard extends StatefulWidget {
  final double amount;
  const WithdrawCard({
    super.key,
    required this.amount,
  });

  @override
  State<WithdrawCard> createState() => _WithdrawCardState();
}

class _WithdrawCardState extends State<WithdrawCard> {
  final TransactionController transactionController = TransactionController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  @override
  void dispose() {
    transactionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(58),
          topRight: Radius.circular(58),
        ),
      ),
      child: ListView(
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
          TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: widget.amount.toString(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Account Name', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: accountNameController,
            decoration: const InputDecoration(
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
          TextField(
            controller: bankNameController,
            decoration: const InputDecoration(
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
          TextField(
            controller: bankNumberController,
            decoration: const InputDecoration(
              hintText: '012567154321076',
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Obx(
            () => LoadingButton(
                loading: transactionController.isLoading.value,
                onClick: () async {
                  await transactionController.withdraw(
                      accountNameController.text,
                      bankNameController.text,
                      bankNumberController.text);
                },
                buttonName: 'Withdraw'),
          )
        ],
      ),
    );
  }
}
