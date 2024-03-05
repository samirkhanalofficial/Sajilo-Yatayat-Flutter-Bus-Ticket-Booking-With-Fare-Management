import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/models/fare_details.dart';
import 'package:tryapp/ui/pages/qrcode/generate_qr_code_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TicketBooked extends StatefulWidget {
  final FareDetails fareDetails;
  final Function onCancel;

  const TicketBooked(
      {super.key, required this.fareDetails, required this.onCancel});

  @override
  State<TicketBooked> createState() => _TicketBookedState();
}

class _TicketBookedState extends State<TicketBooked> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.fareDetails.departure.from.name} to ${widget.fareDetails.departure.to.name}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rs. ${widget.fareDetails.amount}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    widget.fareDetails.bus.busnumber,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Seats: ${widget.fareDetails.seats}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "#${widget.fareDetails.id}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.fareDetails.status,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    widget.fareDetails.departure.time,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    widget.fareDetails.departure.date,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  Get.to(() => GenerateQrPage(
                        fareId: widget.fareDetails.id,
                      ));
                },
                icon: const Icon(Icons.document_scanner_outlined),
                label: const Text(
                  'Show QR',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  launchUrlString(
                      "tel://${widget.fareDetails.isFaredByUser ? widget.fareDetails.bus.owners.first.mobile : widget.fareDetails.faredBy.mobile}");
                },
                icon: const Icon(Icons.call),
                label: const Text(
                  'Call',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // TextButton.icon(
              //   onPressed: () {
              //     widget.onCancel();
              //   },
              //   icon: const Icon(
              //     Icons.cancel,
              //     color: Colors.red,
              //   ),
              //   label: const Text(
              //     'Cancel',
              //     style: TextStyle(
              //       fontSize: 16,
              //       color: Colors.red,
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
