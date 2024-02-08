import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  dynamic userProfileData;
  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  void getUserProfile() async {
    try {
      var response = await Dio().get(
        "https://sajiloyatayatbackend.samirk.com.np/user/mydetails",
        options: Options(headers: {
          "Authorization": Get.arguments,
          "Content-Type": "application/json",
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          userProfileData = response.data;
        });
      } else {
        Get.snackbar('${response.statusCode}', '${response.statusMessage}');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
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
                  onPressed: () {},
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
              repeat: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'asset/images/g-icon.png',
                  width: 45,
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
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Iconsax.edit),
                  label: const Text(
                    'Edit',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${userProfileData['name']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${userProfileData['gender']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Mobile Number',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${userProfileData['mobile']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Date of Birth (AD)',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${userProfileData['dob']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${userProfileData['address']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
