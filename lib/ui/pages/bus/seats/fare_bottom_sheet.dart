import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/departure_controller.dart';
import 'package:tryapp/controllers/fare_controller.dart';
import 'package:tryapp/models/departure_details.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';
import 'package:tryapp/ui/widgets/global/pin_input_field.dart';

class FareBottomSheet extends StatefulWidget {
  final DepartureDetails departure;
  final DepartureController departureController;
  final FareController fareController;
  const FareBottomSheet({
    super.key,
    required this.departure,
    required this.departureController,
    required this.fareController,
  });

  @override
  State<FareBottomSheet> createState() => _FareBottomSheetState();
}

class _FareBottomSheetState extends State<FareBottomSheet> {
  final TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    String price = ((widget.departure.amount *
                widget.departureController.selectedSeats.length)
            .toInt())
        .toString();
    if (price.length < 5) {
      for (int i = price.length; i < 5; i++) {
        price = '0$price';
      }
    }
    priceController.text = price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('Book seat', style: Theme.of(context).textTheme.titleLarge),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'After you fare, it can only proceed ahead after another person approves it.',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(
            height: 10,
          ),
          PinInputFiled(length: 5, controller: priceController),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => LoadingButton(
                  loading: widget.fareController.isLoading.value,
                  onClick: () async {
                    await widget.fareController.addFare(
                        widget.departure.id,
                        widget.departureController.selectedSeats,
                        double.parse(priceController.text));
                  },
                  buttonName: 'Book Now'),
            ),
          )
        ],
      ),
    );
  }
}
