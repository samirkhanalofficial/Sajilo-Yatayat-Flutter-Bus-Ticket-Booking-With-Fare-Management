import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.logout,
                  size: 20,
                  color: Colors.black,
                ),
                label: Text("Logout",
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
