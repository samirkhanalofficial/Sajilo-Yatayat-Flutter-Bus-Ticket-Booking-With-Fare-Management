import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/controllers/payment_controller.dart';
import 'package:tryapp/models/fare_details.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';
import 'package:tryapp/ui/widgets/global/pin_input_field.dart';

class PayFareBottomSheet extends StatefulWidget {
  final FareDetails fareDetails;
  const PayFareBottomSheet({super.key, required this.fareDetails});

  @override
  State<PayFareBottomSheet> createState() => _PayFareBottomSheetState();
}

class _PayFareBottomSheetState extends State<PayFareBottomSheet> {
  TextEditingController khaltiPinController = TextEditingController();
  TextEditingController khaltiMobileNumberController = TextEditingController();
  TextEditingController khaltiOtpController = TextEditingController();
  PaymentController paymentController = PaymentController();
  @override
  void initState() {
    khaltiMobileNumberController.text =
        widget.fareDetails.faredBy.mobile.replaceFirst("+977", "");
    super.initState();
  }

  @override
  void dispose() {
    paymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('Pay to Confirm', style: Theme.of(context).textTheme.titleLarge),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Please pay the price within 5minutes otherwise fare will get cancelled.',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: [
              Obx(
                () => ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    if (paymentController.token.value == "") ...[
                      Text('Khalti Mobile Number',
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: khaltiMobileNumberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: '9800000000',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('Khalti Transaction Pin ',
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: PinInputFiled(
                          length: 4,
                          controller: khaltiPinController,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Obx(() => ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      if (paymentController.token.value != "") ...[
                        Text('Khalti OTP',
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: PinInputFiled(
                            length: 6,
                            controller: khaltiOtpController,
                          ),
                        ),
                      ],
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => LoadingButton(
                      loading: paymentController.isLoading.value,
                      onClick: () async {
                        if (paymentController.token.value == "") {
                          await paymentController.initilizeKhaltiPayment(
                            widget.fareDetails.id,
                            khaltiMobileNumberController.text,
                            khaltiPinController.text,
                          );
                        } else {
                          await paymentController
                              .confirmKhaltiPayment(khaltiOtpController.text);
                        }
                      },
                      buttonName: 'Pay @ Rs. ${widget.fareDetails.amount}'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
