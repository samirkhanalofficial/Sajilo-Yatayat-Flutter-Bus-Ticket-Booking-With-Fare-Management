import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/ui/pages/registration/user/user_profile.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;
    final List<Widget> pages = [const UserProfile()];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
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
          onPressed: () {},
          icon: const Icon(
            Iconsax.profile_circle5,
          ),
        ),
      ],
    );
  }
}
