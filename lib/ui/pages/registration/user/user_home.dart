import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/ui/pages/bus/avilable_bus_page.dart';
import 'package:tryapp/ui/pages/registration/user/user_booking_details_page.dart';
import 'package:tryapp/ui/pages/registration/user/user_profile.dart'; 
import 'package:tryapp/ui/pages/wallet/wallet_page.dart';
import 'package:tryapp/ui/widgets/global/nav_bar.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int currentPage = 0;
  final List<Widget> pageList = [
    const AvilableBusPage(),
    const WalletPage(),
    const UserBookingDetailsPage(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: NavBar(
          selectedIndex: currentPage,
          onIndexChange: (int index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
      ),
      body: IndexedStack(index: currentPage, children: pageList),
    );
  }
}
