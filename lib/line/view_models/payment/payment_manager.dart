import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/db/firestore/fb_db_manager.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/main.dart';

import '../../../models/payment_model.dart';

class PaymentProviderNotifier extends StateNotifier<void> {
  PaymentProviderNotifier(void state) : super(null);
  final _dbWorks = FirebaseDbManager();

  Future<bool> billPayment(
      WidgetRef ref, String userId, PaymentModel? paymentModel) async {
    try {
      ref
          .read(currentLoadingManager.notifier)
          .changeState(LoadingStates.loading);
      await _dbWorks.billPayment(userId, paymentModel);
      await Future.delayed(const Duration(seconds: 2));
      ref.read(currentLoadingManager.notifier).changeState(LoadingStates.idle);
      return true;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  Future<List<PaymentModel?>> getPaymentList(
      WidgetRef ref, String userId) async {
    try {
      return await _dbWorks.getPayments(userId);

    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
