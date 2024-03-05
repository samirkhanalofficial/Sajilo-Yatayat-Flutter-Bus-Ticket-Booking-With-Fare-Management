import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/fare_controller.dart';
import 'package:tryapp/models/fare_details.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class BargainFairCard extends StatefulWidget {
  final FareDetails fareDetails;
  final FareController fareController;

  const BargainFairCard(
      {super.key, required this.fareDetails, required this.fareController});

  @override
  State<BargainFairCard> createState() => _CurrentFairCardState();
}

class _CurrentFairCardState extends State<BargainFairCard> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newPrice = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(13.0),
      height: 450,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(58),
          topRight: Radius.circular(58),
        ),
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 38,
          ),
          Center(
            child: Text("Current \n Fare",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(
            height: 33,
          ),
          Text("Previous Price: ${widget.fareDetails.amount}",
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 33,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Fare',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: newPrice,
            decoration: const InputDecoration(
              hintText: '4000',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => LoadingButton(
                onClick: () {
                  widget.fareController.changePriceAndOfferFare(
                    widget.fareDetails.id,
                    double.parse(newPrice.text),
                  );
                },
                loading: widget.fareController.isLoading.value,
                buttonName: 'Fare Sent'),
          )
        ],
      ),
    );
  }
}
