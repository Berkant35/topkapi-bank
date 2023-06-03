import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/ui/home/transfers/helper_of_transfer_widgets/qr_states/enter_value_of_amount_qr_content.dart';
import 'package:topkapi_bank/ui/home/transfers/helper_of_transfer_widgets/qr_states/result_of_qr_content.dart';
import 'package:topkapi_bank/ui/home/transfers/helper_of_transfer_widgets/qr_states/search_iban_with_qr_content.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';
import 'package:topkapi_bank/utilities/constants/extension/edge_extension.dart';

import '../../../../line/view_models/eft/qr_with_send_money_manager.dart';

class QrPage extends ConsumerStatefulWidget {
  const QrPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _QrPageState();
}

class _QrPageState extends ConsumerState<QrPage> {


  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef customRef, Widget? child) {

      final qrContentState = customRef.watch(currentQrSendMoneyState);


      switch(qrContentState){

        case QrSendStates.search:
         return const SearchIbanWithQrContainer();
        case QrSendStates.send:
          return const EnterValueOfAmountQrContent();
        case QrSendStates.result:
          return const ResultOfQrContent();
        default:
          return const SearchIbanWithQrContainer();
      }
    },);
  }
}
