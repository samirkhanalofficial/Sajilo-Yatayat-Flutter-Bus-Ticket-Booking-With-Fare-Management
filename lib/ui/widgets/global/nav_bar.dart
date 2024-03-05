import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/config/colors/app_color.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function onIndexChange;
  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: Row(
        children: [
          NavIconItem(
            name: "Home",
            icon: Iconsax.home_24,
            index: 0,
            selectedIndex: selectedIndex,
            onIndexChange: onIndexChange,
          ),
          NavIconItem(
            name: "Transactions",
            icon: Iconsax.wallet_24,
            index: 1,
            selectedIndex: selectedIndex,
            onIndexChange: onIndexChange,
          ),
          const SizedBox(
            width: 50,
          ),
          NavIconItem(
            name: "Ticket",
            icon: Iconsax.ticket,
            index: 2,
            selectedIndex: selectedIndex,
            onIndexChange: onIndexChange,
          ),
          NavIconItem(
            name: "Profile",
            icon: Iconsax.profile_circle,
            index: 3,
            selectedIndex: selectedIndex,
            onIndexChange: onIndexChange,
          ),
        ],
      ),
    );
  }
}

class NavIconItem extends StatelessWidget {
  const NavIconItem({
    super.key,
    required this.name,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onIndexChange,
  });
  final String name;
  final IconData icon;
  final int index, selectedIndex;
  final Function onIndexChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(9),
        onTap: () {
          onIndexChange(index);
        },
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Expanded(
                  child: Icon(
                icon,
                color: index == selectedIndex
                    ? AppColor().primary
                    : Colors.grey.shade500,
              )),
              Text(
                name,
                style: TextStyle(
                  color: index == selectedIndex
                      ? AppColor().primary
                      : Colors.grey.shade500,
                  fontSize: 11,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
