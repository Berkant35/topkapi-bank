import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:state_notifier/state_notifier.dart';
import 'package:topkapi_bank/line/db/firestore/fb_db_manager.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';

import '../../../main.dart';
import '../../../ui/auth/customs/complex_inherited.dart';

enum QrSendStates { search, send, result }

class QrSendStatesControlNotifier extends StateNotifier<QrSendStates> {
  QrSendStatesControlNotifier(QrSendStates state) : super(QrSendStates.search);

  final firebaseDbManager = FirebaseDbManager();

  late BankUser? receiverBankUser;
  late String? currentIban;

  Future<bool> checkAnyHasUser(String iban,
      {bool getAndSetForStandartIbanMode = false, WidgetRef? ref}) async {
    final result = await firebaseDbManager.anyHasUserWithThisIban(iban);
    logger.i("Check Any Has User:$result");
    if (result) {
      currentIban = iban;
      if (getAndSetForStandartIbanMode) {
        getAndSetBankUser(ref);
      }
    }
    return result;
  }

  Future<void> getAndSetBankUser(WidgetRef? ref) async {
    if (currentIban != null) {
      logger.i("Get And Set Bank User");
      receiverBankUser =
          await firebaseDbManager.getBankUserWithIban(currentIban!);
      logger.i("Receiver Bank User:${receiverBankUser!.userName}");
      ComplexInherited.of(ref!.context).sendIbanNumberController.text =
          "${receiverBankUser!.userName!.substring(0, 1).padRight(receiverBankUser!.userName!.length - 1, "*")} ${receiverBankUser!.surName!.substring(0, 1).padRight(receiverBankUser!.surName!.length - 1, "*")}";
    } else {
      logger.e("Error!");
    }
  }

  void changState(QrSendStates val) => state = val;
}
