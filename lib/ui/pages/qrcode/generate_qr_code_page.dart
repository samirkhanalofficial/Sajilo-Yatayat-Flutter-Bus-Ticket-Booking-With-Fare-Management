import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tryapp/models/fare_details.dart';

class GenerateQrPage extends StatelessWidget {
  final FareDetails fare;
  const GenerateQrPage({super.key, required this.fare});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: QrImageView(
                  data: fare.id.toString(),
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "This QR contains your profile ID, which can be used to see your balance & make transaction with your Pin. Don’t share it to anybody, only show it to let them scan it.",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
