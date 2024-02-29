import 'package:flutter/material.dart';
import 'package:tryapp/ui/widgets/global/wallet/fare_sent_card.dart';

class FareSentPage extends StatelessWidget {
  const FareSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          children: const [
            SizedBox(
              height: 70,
            ),
            Text(
              "Fare \nSent",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  height: 1,
                  fontWeight: FontWeight.w500),
            ),
            FareSentCard()
          ],
        ),
      ),
    );
  }
}
