import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/pages/bottom_bar_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannPage extends StatefulWidget {
  const QrScannPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScannPageState();
}

class _QrScannPageState extends State<QrScannPage> {
  Barcode? result;
  String qrcode = '';
  QRViewController? controller;
  bool _flashOn = false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child:Container(
                // color: Colors.transparent.withOpacity(1),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_backspace_rounded,
                        color: Colors.white,),
                      onPressed: () {
                        setState(() {
                          Navigator.push( context,
                            MaterialPageRoute(
                              builder: (context) => BottomBarPage(),
                            ),
                          );
                        });
                      },)
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: buildQrView(context)),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent.withOpacity(1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                          child: IconButton(
                              onPressed: () async {
                                await controller!.toggleFlash();
                                setState(() {
                                  _flashOn = !_flashOn;
                                });
                              },
                              icon: Icon(
                                _flashOn
                                    ? Icons.flash_on_outlined
                                    : Icons.flash_off_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      // TODO надо разобраться перессылкой qr по адресу
                      Center(
                          child:  (result != null)
                              ?Text("Result: ${result!.code}")
                              :const Text("Scan a code",
                            style: TextStyle(color: Colors.red),)
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (qrcode.isEmpty){
        qrcode = scanData.code!;
        if(qrcode.isNotEmpty){
          this.controller?.pauseCamera();
          if (kDebugMode) {
            print(qrcode);
          }
        }
      }
    });
  }
}