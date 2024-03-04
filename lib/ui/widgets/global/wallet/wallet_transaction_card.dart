import 'package:flutter/material.dart';
import 'package:tryapp/models/transaction_details.dart';

class WalletTransactionCard extends StatelessWidget {
  final TransactionDetails transactionDetails;
  const WalletTransactionCard({super.key, required this.transactionDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 0.5,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("# ${transactionDetails.id}"),
                Text(
                  transactionDetails.isIncomming
                      ? "SeatBooking"
                      : !transactionDetails.isUser
                          ? !transactionDetails.isDone
                              ? "Withdraw Pending"
                              : "Withdrawn"
                          : "Paid",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: transactionDetails.isIncomming
                            ? Colors.green
                            : !transactionDetails.isUser &&
                                    !transactionDetails.isDone
                                ? Colors.yellow.shade700
                                : Colors.red,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Rs. ${transactionDetails.amount}",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: transactionDetails.isIncomming
                      ? Colors.green
                      : Colors.red),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(transactionDetails.method),
                Icon(
                  transactionDetails.isIncomming
                      ? Icons.download_sharp
                      : Icons.upload_sharp,
                  color: transactionDetails.isIncomming
                      ? Colors.green
                      : Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Rs. ${transactionDetails.amount}",
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: transactionDetails.isIncomming
                          ? Colors.green
                          : Colors.red,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
