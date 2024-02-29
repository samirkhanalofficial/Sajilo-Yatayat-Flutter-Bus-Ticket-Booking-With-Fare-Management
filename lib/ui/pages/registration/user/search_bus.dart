import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchBusPage extends StatelessWidget {
  const SearchBusPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Text('Ticket Booking',
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
            height: 34,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.search_normal),
            label: const Text('Search'),
          )
        ],
      ),
    );
  }
}
