import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/ui/widgets/global/user_details.dart';

class UserProfile extends StatefulWidget {
  final UserController userController;

  const UserProfile({
    super.key,
    required this.userController,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  BusController busController = BusController();

  @override
  void initState() {
    busController.getMyBuses();
    super.initState();
  }

  @override
  void dispose() {
    busController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => widget.userController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () => widget.userController.getUserDetail(),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                              firebaseMessaging.unsubscribeFromTopic(
                                  widget.userController.userDetails.value?.id ??
                                      "");
                              BusController busController = BusController();
                              String selectedBus =
                                  await busController.getSelectedBus();
                              if (selectedBus != "") {
                                firebaseMessaging
                                    .unsubscribeFromTopic(selectedBus);
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
                      if (!widget.userController.isPassengerCheck.value)
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: PageView(
                            controller: PageController(
                              initialPage: 0,
                              viewportFraction: 0.9,
                            ),
                            children: [
                              if (busController.myBuses.isNotEmpty)
                                ...busController.myBuses.first.images.map(
                                  (imageUrl) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(19),
                                      child: Container(
                                        color: Colors.black,
                                        child: CachedNetworkImage(
                                            imageUrl: imageUrl),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      if (widget.userController.isPassengerCheck.value)
                        Lottie.asset(
                          'asset/animations/user.json',
                          height: MediaQuery.of(context).size.height * 0.33,
                          animate: true,
                          reverse: false,
                          repeat: true,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'asset/images/g-icon.png',
                            width: 45,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('My Profile',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text('This information identifies you',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),

                          // TextButton.icon(
                          //   onPressed: () {},
                          //   icon: const Icon(Iconsax.edit),
                          //   label: const Text(
                          //     'Edit',
                          //     style: TextStyle(fontSize: 16),
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      UserDetailsFields(
                        title: 'Full Name',
                        value:
                            widget.userController.userDetails.value?.name ?? '',
                      ),
                      UserDetailsFields(
                        title: 'Mobile Number',
                        value:
                            widget.userController.userDetails.value?.mobile ??
                                '',
                      ),
                      UserDetailsFields(
                          title: 'Date of Birth (AD)',
                          value: widget.userController.userDetails.value?.dob
                              .toUtc()
                              .toString()
                              .substring(0, 10)),
                      UserDetailsFields(
                        title: 'Address',
                        value:
                            widget.userController.userDetails.value?.address ??
                                "",
                      ),
                      if (!widget.userController.isPassengerCheck.value)
                        if (busController.myBuses.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserDetailsFields(
                                title: 'Bus Number',
                                value: busController.myBuses.first.busnumber,
                              ),
                              UserDetailsFields(
                                title: 'Bus Name',
                                value: busController.myBuses.first.yatayat,
                              ),
                              UserDetailsFields(
                                title: 'Bus Type',
                                value: busController.myBuses.first.bustype,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Features',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ...busController.myBuses.first.features.map(
                                      (features) => Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image.asset(
                                          'asset/images/$features.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
