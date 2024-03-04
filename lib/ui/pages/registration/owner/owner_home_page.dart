import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/controllers/departure_controller.dart';
import 'package:tryapp/controllers/location_controller.dart';
import 'package:tryapp/ui/pages/bus/add_bus_page.dart';
import 'package:tryapp/ui/pages/location/location_page.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';
import 'package:tryapp/ui/widgets/global/pin_Input_field.dart';
import 'package:tryapp/ui/widgets/global/wallet/my_balance_card.dart';

class OwnerHomePage extends StatefulWidget {
  final LocationController locationController;

  const OwnerHomePage({
    super.key,
    required this.locationController,
  });

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  final DepartureController departureController = (DepartureController());

  final price = TextEditingController();
  final dateTimeController = TextEditingController();
  String date = "", time = "";
  @override
  void dispose() {
    departureController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  Get.toNamed(
                    RoutesNames.avilableBusPage,
                  );
                },
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
                    hintText: widget.locationController.selectedFromLocation
                            .value?.name ??
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
                    hintText: widget.locationController.selectedToLocation.value
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
            Text('Date & Time', style: Theme.of(context).textTheme.titleSmall),
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
                      controller: dateTimeController,
                      enabled: false,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: 'Please select a date & time',
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
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((timeValue) {
                            if (timeValue != null) {
                              date =
                                  '${value.year}-${value.month < 10 ? '0${value.month}' : value.month}-${value.day < 10 ? '0${value.day}' : value.day}';
                              time =
                                  '${timeValue.hour < 10 || (timeValue.hour > 12 && timeValue.hour < 22) ? '0' : ''}${timeValue.format(context)}';
                              dateTimeController.text = '$date at $time';
                            }
                          });
                        }
                      });
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
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
            LoadingButton(
              buttonName: 'Add',
              onClick: () {
                departureController.addDeparture(
                    date,
                    widget.locationController.selectedFromLocation.value?.id ??
                        '',
                    widget.locationController.selectedToLocation.value?.id ??
                        '',
                    time,
                    double.parse(price.text));
              },
              loading: departureController.isLoading.value,
            )
          ],
        ),
      ),
    );
  }
}
