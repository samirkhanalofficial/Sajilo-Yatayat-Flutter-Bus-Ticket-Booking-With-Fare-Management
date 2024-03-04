import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tryapp/config/colors/app_color.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/ui/widgets/global/wallet/withdraw_card.dart';

class MyBalanceCard extends StatefulWidget {
  const MyBalanceCard({super.key});

  @override
  State<MyBalanceCard> createState() => _MyBalanceCardState();
}

class _MyBalanceCardState extends State<MyBalanceCard> {
  BusController busController = BusController();

  initilizeUI() async {
    await busController.getSelectedBus();
  }

  @override
  void initState() {
    initilizeUI();
    busController.getMyBuses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => busController.isLoading.value
          ? ClipRRect(
              borderRadius: BorderRadius.circular(19),
              child: Shimmer(
                enabled: true,
                loop: 999,
                period: const Duration(milliseconds: 1800),
                gradient: LinearGradient(colors: [
                  Colors.grey.shade300,
                  Colors.grey.shade700,
                ]),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                ),
              ),
            )
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Iconsax.wallet_3,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'My Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs. ${busController.myBuses.where((p0) => p0.id == busController.selectedBus.value).first.balance}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'You can withdraw this balance to your bank account.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(29),
                        ),
                        color: Colors.white,
                        border: Border.fromBorderSide(BorderSide(
                          width: 1,
                          color: AppColor().primary,
                        ))),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(29)),
                        onTap: () {
                          Get.bottomSheet(
                              WithdrawCard(
                                  amount: busController.myBuses
                                      .where((p0) =>
                                          p0.id ==
                                          busController.selectedBus.value)
                                      .first
                                      .balance),
                              isScrollControlled: false);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Icon(
                                Iconsax.wallet,
                                size: 30,
                              ),
                              Text("Withdraw")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
