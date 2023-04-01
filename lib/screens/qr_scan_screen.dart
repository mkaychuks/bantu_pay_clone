
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/screens/home_screen.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  MobileScannerController cameraController = MobileScannerController();

  bool _modalController = false;

  void _foundBarCode(BarcodeCapture barcode) {
    final List<Barcode> barcodes = barcode.barcodes;
    for (var qrCode in barcodes) {
      if (qrCode.rawValue.toString() == "IGHUBPASSWORD") {
        setState(() {
          _modalController = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _modalController = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const HomeScreen();
              },
            ),
          );
        });
      }
      // debugPrint('Barcode found! ${qrCode.rawValue}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: ModalProgressHUD(
          inAsyncCall: _modalController,
          opacity: 0.5,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              MobileScanner(
                onDetect: _foundBarCode,
                controller: cameraController,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Text(
                  "Place over a QRCode to Scan",
                  style: TextStyle(fontSize: 24.sp, color: Colors.blueGrey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
