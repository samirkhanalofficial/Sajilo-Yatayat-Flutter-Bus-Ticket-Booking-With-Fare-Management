import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/controllers/location_controller.dart';

class LocationPage extends StatefulWidget {
  final LocationController locationController;
  const LocationPage({super.key, required this.locationController});

  @override
  State<LocationPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LocationPage> {
  initilize() async {
    await widget.locationController.getlocations();
  }

  @override
  void initState() {
    initilize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
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
            ...widget.locationController.locations.map(
              (element) => Text(element.name),
            ),
            TextButton(
              onPressed: () async {
                await widget.locationController.getlocations();
                print(widget.locationController.locations);
              },
              child: Text('Click me'),
            )
          ],
        ),
      )),
    );
  }
}
