import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tryapp/config/routes/routes_names.dart';

import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/ui/widgets/global/user_details.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    userController.getUserDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: userController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('< Back')),
                        TextButton.icon(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () async {
                            FirebaseAuth.instance.signOut();
                            SharedPreferences sf =
                                await SharedPreferences.getInstance();
                            sf.setBool("isLogginned", false);
                            Get.offAllNamed(RoutesNames.loginPage);
                          },
                          icon: const Icon(
                            Iconsax.logout_1,
                            size: 25,
                          ),
                          label: const Text("Logout"),
                        ),
                      ],
                    ),
                    Lottie.asset(
                      'asset/animations/user.json',
                      height: MediaQuery.of(context).size.height * 0.33,
                      animate: true,
                      reverse: true,
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
                                style: Theme.of(context).textTheme.titleMedium),
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
                    Obx(
                      () {
                        return UserDetailsFields(
                          title: 'Full Name',
                          value: userController.userDetails.value?.name ?? '',
                        );
                      },
                    ),
                    Obx(
                      () {
                        return UserDetailsFields(
                          title: 'Mobile Number',
                          value: userController.userDetails.value?.mobile ?? '',
                        );
                      },
                    ),
                    // Obx(
                    //   () {
                    //     return UserDetailsFields(
                    //       title: 'Date of Birth (AD)',
                    //       value:
                    //           getUserDetailsController.userDetails.value?.dob.isUtc ??
                    //               "",
                    //     );
                    //   },
                    // ),
                    Obx(
                      () {
                        return UserDetailsFields(
                          title: 'Address',
                          value:
                              userController.userDetails.value?.address ?? "",
                        );
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
