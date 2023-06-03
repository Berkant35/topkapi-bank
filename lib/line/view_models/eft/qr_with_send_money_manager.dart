import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:state_notifier/state_notifier.dart';
import 'package:topkapi_bank/line/db/firestore/fb_db_manager.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';

import '../../../main.dart';

enum QrSendStates { search, send, result }

class QrSendStatesControlNotifier extends StateNotifier<QrSendStates> {
  QrSendStatesControlNotifier(QrSendStates state) : super(QrSendStates.search);

  final firebaseDbManager = FirebaseDbManager();

  late BankUser? receiverBankUser;
  late String? currentIban;

  Future<bool> checkAnyHasUser(String iban) async {
    final result = await firebaseDbManager.anyHasUserWithThisIban(iban);
    if (result) {
      currentIban = iban;
    }
    return result;
  }

  Future<void> getAndSetBankUser() async {
    if(currentIban != null){
      receiverBankUser = await firebaseDbManager.getBankUserWithIban(currentIban!);
    }else{
      logger.e("Error!");
    }

  }

  void changState(QrSendStates val) => state = val;
}
