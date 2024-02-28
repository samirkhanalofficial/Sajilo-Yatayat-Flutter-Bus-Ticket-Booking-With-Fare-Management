import 'package:flutter/material.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_bargain.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_booked.dart';
import 'package:tryapp/ui/widgets/global/ticket/ticket_cancelled.dart';

class UserBookingDetailsPage extends StatelessWidget {
  const UserBookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(13.0),
          children: [
            Row(
              children: [
                Image.asset(
                  'asset/images/g-icon.png',
                  width: 45,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Bookings',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('This is the list of your bookings.',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const TicketBooked(),
            const SizedBox(
              height: 25,
            ),
            const TicketCancelled(),
            const SizedBox(
              height: 25,
            ),
            const TicketBargan()
          ],
        ),
      ),
    );
  }
}
