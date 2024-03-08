import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tryapp/config/colors/app_color.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/models/bus_details.dart';

class SwitchUserBottomSheet extends StatefulWidget {
  final UserController userController;
  final BusController busController;
  const SwitchUserBottomSheet({
    super.key,
    required this.userController,
    required this.busController,
  });

  @override
  State<SwitchUserBottomSheet> createState() => _SwitchUserBottomSheetState();
}

class _SwitchUserBottomSheetState extends State<SwitchUserBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Switch User',
                    style: Theme.of(context).textTheme.titleLarge),
                TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () async {
                    FirebaseMessaging firebaseMessaging =
                        FirebaseMessaging.instance;

                    FirebaseAuth.instance.signOut();
                    SharedPreferences sf =
                        await SharedPreferences.getInstance();
                    await firebaseMessaging.unsubscribeFromTopic(
                        widget.userController.userDetails.value!.id);
                    for (BusDetails bus in widget.busController.myBuses) {
                      await firebaseMessaging.unsubscribeFromTopic(bus.id);
                    }

                    sf.clear();
                    Get.offAllNamed(RoutesNames.splashScreenPage);
                  },
                  icon: const Icon(
                    Iconsax.logout_1,
                    size: 25,
                  ),
                  label: const Text("Logout"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Click on below profiles to switch your role.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onTap: widget.userController.isPassengerCheck.value
                  ? null
                  : () async {
                      await widget.userController.setRole("Passenger");
                      Get.offAllNamed(RoutesNames.userHomePage);
                    },
              tileColor: widget.userController.isPassengerCheck.value
                  ? Colors.grey.shade200
                  : Colors.transparent,
              title: Text(widget.userController.userDetails.value?.name ??
                  "User profile"),
              subtitle: const Text("Passenger"),
              leading: const Icon(
                Iconsax.user,
                size: 35,
              ),
              trailing: widget.userController.isPassengerCheck.value
                  ? Icon(
                      Icons.check_circle,
                      color: AppColor().primary,
                    )
                  : null,
            ),
            if (widget.busController.myBuses.isNotEmpty)
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...widget.busController.myBuses.map(
                    (bus) => ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onTap: bus.id == widget.busController.selectedBus.value &&
                              !widget.userController.isPassengerCheck.value
                          ? null
                          : () {
                              widget.busController.setSelectedBus(bus.id);
                              widget.userController.setRole("Driver");
                              Get.offAndToNamed(RoutesNames.userHomePage);
                            },
                      tileColor:
                          bus.id == widget.busController.selectedBus.value &&
                                  !widget.userController.isPassengerCheck.value
                              ? Colors.grey.shade200
                              : Colors.transparent,
                      title: Text(bus.busnumber),
                      subtitle: const Text("Bus Owner"),
                      leading: const Icon(
                        Iconsax.bus,
                        size: 35,
                      ),
                      trailing:
                          bus.id == widget.busController.selectedBus.value &&
                                  !widget.userController.isPassengerCheck.value
                              ? Icon(
                                  Icons.check_circle,
                                  color: AppColor().primary,
                                )
                              : null,
                    ),
                  )
                ],
              ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
              onPressed: () async {
                Get.toNamed(RoutesNames.addBusPage);
              },
              icon: const Icon(
                Iconsax.add,
                size: 25,
              ),
              label: const Text("Add Bus"),
            ),
          ],
        ),
      ),
    );
  }
}
