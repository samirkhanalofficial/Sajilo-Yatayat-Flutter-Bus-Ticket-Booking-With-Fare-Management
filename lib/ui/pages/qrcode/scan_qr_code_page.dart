import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tryapp/config/colors/app_color.dart';

class QRCodeScannerApp extends StatefulWidget {
  final Function onFound;
  const QRCodeScannerApp({super.key, required this.onFound});

  @override
  State<QRCodeScannerApp> createState() => _QRCodeScannerAppState();
}

class _QRCodeScannerAppState extends State<QRCodeScannerApp> {
  MobileScannerController mobileScannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    autoStart: true,
    useNewCameraSelector: true,
    formats: [BarcodeFormat.all],
    facing: CameraFacing.back,
    torchEnabled: false,
  );
  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            // fit: BoxFit.contain,
            controller: mobileScannerController,

            onDetect: (capture) {
              print("detecting");
              final List<Barcode> barcodes = capture.barcodes;
              final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                Get.back();
                widget.onFound(barcode.rawValue);
                break;
              }
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor().primary,
                        style: BorderStyle.solid,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(29)),
                  width: 250,
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: const Text("Show your ticket here.")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
