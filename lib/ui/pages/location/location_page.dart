import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/controllers/location_controller.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LocationPage> {
  final LocationController locationController = Get.put(LocationController());
  @override
  void initState() {
    locationController.getlocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.arrow_back_ios,
              //     size: 40,
              //   ),
              // ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Kathmandu',
                    suffixIcon: Icon(Iconsax.search_normal_1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Search Results',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            onPressed: () async {
              await locationController.getlocations();
              print(locationController.locations);
            },
            child: Text('Click me'),
          )
        ],
      )),
    );
  }
}
