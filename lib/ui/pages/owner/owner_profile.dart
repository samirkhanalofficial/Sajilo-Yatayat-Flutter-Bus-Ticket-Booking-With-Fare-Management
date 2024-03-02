import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:tryapp/config/routes/routes_names.dart';


class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [my_profile()]),
    );
  }
}

class my_profile extends StatefulWidget {
  const my_profile({super.key});

  @override
  State<my_profile> createState() => _my_profileState();
}

class _my_profileState extends State<my_profile> {
  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF0ACF83);
    return Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Get.toNamed(RoutesNames.homePage);
                    },
                    icon: const Icon(Icons.logout_rounded),
                    label: const Text("Logout")),
              ],
            ),
            Lottie.asset(
              'asset/animations/register.json',
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: 400, // Adjust the height as needed
              fit: BoxFit.fill,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('asset/images/activity.png'),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "This information helps us identify you",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Get.toNamed(RoutesNames.regpage);
                    },
                    icon: Image.asset('asset/images/edit.png'),
                    label: const Text(
                      "Edit",
                      style: TextStyle(color: green, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Full Name",
                  style: Theme.of(context).textTheme.bodyMedium              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "owner name",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                "Mobile Number",
                  style: Theme.of(context).textTheme.bodyMedium              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "owner mobile number",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                "Date of Birth",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "owner DOB",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                "Address",
                  style: Theme.of(context).textTheme.bodyMedium              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "owner address",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                "Bus Number",
                  style: Theme.of(context).textTheme.bodyMedium              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "owner bus number",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                "Yatayat",
                  style: Theme.of(context).textTheme.bodyMedium              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Sajilo yatayat",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                "Features",
                  style: Theme.of(context).textTheme.bodyMedium              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('asset/images/wifi.png'),
                  Image.asset('asset/images/monitor.png'),
                  Image.asset('asset/images/AC.png'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
               Text("Ratings", style: Theme.of(context).textTheme.bodyMedium),
              Row(
                children: [
                  Image.asset('asset/images/star.png'),
                   Text("5.0",style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                  ),
                  child: Image.asset('asset/images/scan.png'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(RoutesNames.bus);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      icon: Image.asset('asset/images/home1.png')),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(RoutesNames.wallet);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      icon: Image.asset('asset/images/wallet1.png')),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(RoutesNames.booking);

                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      icon: Image.asset('asset/images/ticket.png')),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(RoutesNames.ownerProfile);

                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      icon: Image.asset('asset/images/profile.png')),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
