import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/controllers/location_controller.dart';

class LocationPage extends StatefulWidget {
  final LocationController locationController;
  final bool isFromPage;
  const LocationPage({
    super.key,
    required this.locationController,
    required this.isFromPage,
  });

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                  ),
                ),
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
              (element) => GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.isFromPage) {
                      widget.locationController.selectedFromLocation.value =
                          element;
                    } else {
                      widget.locationController.selectedToLocation.value =
                          element;
                    }
                    Get.back();
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 2, // specify the border width here
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        element.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(
                        (Icons.arrow_forward_ios_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
