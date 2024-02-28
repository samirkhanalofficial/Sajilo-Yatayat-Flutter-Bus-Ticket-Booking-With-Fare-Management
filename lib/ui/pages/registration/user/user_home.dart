import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/ui/pages/registration/user/search_bus.dart';
import 'package:tryapp/ui/pages/registration/user/user_booking_details_page.dart';
import 'package:tryapp/ui/pages/registration/user/user_profile.dart';
import 'package:tryapp/ui/pages/wallet/wallet_page.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 3;
    final List<Widget> pageList = [
      const SearchBusPage(),
      const UserProfile(),
      const WalletPage(),
      const UserBookingDetailsPage()
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Iconsax.scan),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 20,
        shadowColor: Theme.of(context).primaryColor,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
              icon: const Icon(
                Iconsax.home_15,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.wallet_35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.ticket5,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
              icon: const Icon(
                Iconsax.profile_circle5,
              ),
            ),
          ],
        ),
      ),
      body: pageList[currentPage],
    );
  }
}
