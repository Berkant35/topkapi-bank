import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/eft/qr_with_send_money_manager.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/utilities/components/dialogs/custom_dialogs.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';
import 'package:topkapi_bank/utilities/constants/extension/edge_extension.dart';

import '../../../../../line/view_models/global_providers.dart';

class SearchIbanWithQrContainer extends ConsumerStatefulWidget {
  const SearchIbanWithQrContainer({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SearchIbanWithQrContainerState();
}

class _SearchIbanWithQrContainerState
    extends ConsumerState<SearchIbanWithQrContainer> {
  Barcode? result;
  QRViewController? controller;
  var dontLookScanResult = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.stopCamera();
      final result = handleValidOfDataIsIban(scanData);
      if (result) {
        final checkAnyUserWithThisIban = await ref
            .read(currentQrSendMoneyState.notifier)
            .checkAnyHasUser('TR${scanData.code!}');
        if (checkAnyUserWithThisIban) {
          await ref.read(currentQrSendMoneyState.notifier).getAndSetBankUser();
          ref
              .read(currentQrSendMoneyState.notifier)
              .changState(QrSendStates.send);
        } else {
          CustomDialogs.failed(ref, "Geçersiz Iban",
              "Iban Adresi Bankamızla İlişkisi Bulunmamaktadır");
        }
      } else {
        CustomDialogs.failed(ref, "Geçersiz Qr", "Taranan Qr Geçersiz.");
      }
    });
  }

  bool handleValidOfDataIsIban(Barcode scanData) {
    final data = scanData.code ?? "*";
    return data.length == 24;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller!.resumeCamera(),
        child: const Icon(Icons.replay),
      ),
      body: Padding(
        padding: EdgeInsets.all(EdgeExtension.normalEdge.edgeValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Text(
                  "QR İLE BUL",
                  style: ThemeValueExtension.headline6
                      .copyWith(fontWeight: FontWeight.bold),
                )),
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(EdgeExtension.lowEdge.edgeValue)),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
