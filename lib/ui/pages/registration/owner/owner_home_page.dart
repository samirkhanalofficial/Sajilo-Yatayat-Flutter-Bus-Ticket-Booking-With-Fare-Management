import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/ui/widgets/global/pin_Input_field.dart';
import 'package:tryapp/ui/widgets/global/wallet/my_balance_card.dart';

class OwnerHomePage extends StatelessWidget {
  const OwnerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final price = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Welcome,',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text('Sumit Ray', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 16,
            ),
            const MyBalanceCard(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('view Departures'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Image.asset(
                  'asset/images/logo.png',
                  height: 42,
                  width: 34,
                ),
                const SizedBox(width: 11.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Departing Status',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        'Book long distance tickets of desired bus.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text('From', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Kathmandu',
                prefixIcon: Icon(Iconsax.bus5),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('To', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Jaleshwor',
                prefixIcon: Icon(Iconsax.bus5),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Date & Time', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: '2020-03-18 at  03:00 PM',
                prefixIcon: Icon(Iconsax.bus5),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Price Per Seat (Rs)',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 16,
            ),
            PinInputFiled(length: 5, controller: price),
            const SizedBox(
              height: 34,
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Get.to(() => const OwnerHomePage());
              },
              icon: const Icon(Iconsax.add),
              label: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
