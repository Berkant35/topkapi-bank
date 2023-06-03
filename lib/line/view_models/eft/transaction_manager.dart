import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/db/firestore/fb_db_manager.dart';
import 'package:topkapi_bank/line/view_models/eft/qr_with_send_money_manager.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/models/transaction/custom_transaction.dart';
import 'package:topkapi_bank/utilities/components/dialogs/custom_dialogs.dart';

class TransactionManagerNotifier extends StateNotifier<CustomTransaction?> {
  TransactionManagerNotifier(CustomTransaction? state) : super(null);
  final _dbManager = FirebaseDbManager();

  Future<void> create(WidgetRef ref) async {}

  Future<void> update(WidgetRef ref, CustomTransaction transaction) async {
    state = transaction;
  }

  Future<void> doTransaction(WidgetRef ref, CustomTransaction transaction) async {
    state = transaction;
    final result = await _dbManager.doTransaction(transaction);

    if (result!) {
      ref
          .read(currentQrSendMoneyState.notifier)
          .changState(QrSendStates.result);
    } else {
      CustomDialogs.failed(
          ref, "İşlem Başarısız", "Malesef İşlem Gerçekleştirilemedi");
    }
  }

  Future<void> delete(WidgetRef ref, Transaction transaction) async {}
}
