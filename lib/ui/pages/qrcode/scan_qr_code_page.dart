// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRCodeScannerApp extends StatefulWidget {
//   @override
//   _QRCodeScannerAppState createState() => _QRCodeScannerAppState();
// }

// class _QRCodeScannerAppState extends State<QRCodeScannerApp> {
//   QRViewController? _controller;
//   final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('QR Code Scanner'),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               flex: 5,
//               child: QRView(
//                 key: _qrKey,
//                 onQRViewCreated: _onQRViewCreated,
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Center(
//                 child: Text('Scan a QR code'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       _controller = controller;
//       _controller!.scannedDataStream.listen((scanData) {
//         print('Scanned data: ${scanData.code}');
//         // Handle the scanned data as desired
//       });
//     });
//   }
// }
