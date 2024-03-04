import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/controllers/departure_controller.dart';
import 'package:tryapp/controllers/location_controller.dart';
import 'package:tryapp/ui/pages/bus/user_available_bus_page.dart';

import 'package:tryapp/ui/pages/location/location_page.dart';

class SearchBusPage extends StatefulWidget {
  final LocationController locationController;
  const SearchBusPage({
    super.key,
    required this.locationController,
  });

  @override
  State<SearchBusPage> createState() => _SearchBusPageState();
}

class _SearchBusPageState extends State<SearchBusPage> {
  final DepartureController departureController = (DepartureController());
  TextEditingController dateController = TextEditingController();
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
          InkWell(
            onTap: () {
              Get.to(
                LocationPage(
                    locationController: widget.locationController,
                    isFromPage: true),
              );
            },
            child: Obx(
              () => TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.locationController.selectedFromLocation.value
                          ?.name ??
                      'select a location',
                  prefixIcon: const Icon(Iconsax.bus5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('To', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Get.to(
                LocationPage(
                    locationController: widget.locationController,
                    isFromPage: false),
              );
            },
            child: Obx(
              () => TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget
                          .locationController.selectedToLocation.value?.name ??
                      'select a location',
                  prefixIcon: const Icon(Iconsax.bus5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text('From', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(241, 240, 238, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: dateController,
                    enabled: false,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1))
                        .then((value) {
                      if (value != null) {
                        dateController.text =
                            '${value.year}-${value.month < 10 ? '0${value.month}' : value.month}-${value.day < 10 ? '0${value.day}' : value.day}';
                      }
                    });
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              // await departureController.getAllDepartures(
              //   dateController.text,
              //   widget.locationController.selectedFromLocation.value?.id ?? '',
              //   widget.locationController.selectedToLocation.value?.id ?? '',
              // );
              Get.to(
                () => UserAvailableBusPage(
                  date: dateController.text,
                  fromID: widget
                          .locationController.selectedFromLocation.value?.id ??
                      '',
                  toID:
                      widget.locationController.selectedToLocation.value?.id ??
                          '',
                ),
              );
            },
            icon: const Icon(Iconsax.search_normal),
            label: const Text('Search'),
          )
        ],
      ),
    );
  }
}
