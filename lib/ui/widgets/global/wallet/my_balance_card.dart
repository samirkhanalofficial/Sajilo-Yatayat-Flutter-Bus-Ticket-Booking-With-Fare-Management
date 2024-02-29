import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyBalanceCard extends StatelessWidget {
  const MyBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).primaryColor,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Iconsax.wallet_3,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'My Balance',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'RS. 5679',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'This balance can be used to book  bus , pay for booking or  ride.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
