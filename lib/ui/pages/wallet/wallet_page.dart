import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/transaction_controller.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/ui/widgets/global/wallet/wallet_transaction_card.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  UserController userController = UserController();
  TransactionController transactionController = TransactionController();

  initializeUI() async {
    await userController.isPassenger();
    await userController.getUserDetail();
    if (userController.isPassengerCheck.value) {
      await transactionController.getUsersTransactions();
    } else {
      await transactionController.getBusTransactions();
    }
  }

  @override
  void initState() {
    initializeUI();
    super.initState();
  }

  @override
  void dispose() {
    userController.dispose();
    transactionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => RefreshIndicator(
          onRefresh: () => initializeUI(),
          child: ListView(
            padding: const EdgeInsets.all(13.0),
            children: [
              Text(
                'Welcome,',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(userController.userDetails.value?.name ?? 'User',
                  style: Theme.of(context).textTheme.titleLarge),
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
              if (transactionController.transactions.isEmpty)
                const SizedBox(
                  height: 60,
                ),
              Center(
                child: Image.asset(
                  'asset/images/nodata.png',
                  width: 150,
                ),
              ),
              if (transactionController.isLoading.value)
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ...transactionController.transactions
                  .map((transaction) => WalletTransactionCard(
                        transactionDetails: transaction,
                      )),
            ],
          ),
        ),
      ),
    ));
  }
}
