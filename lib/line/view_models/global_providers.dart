import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/line/view_models/auth/auth_view_model.dart';
import 'package:topkapi_bank/line/view_models/auth/base_auth_control.dart';
import 'package:topkapi_bank/line/view_models/eft/qr_with_send_money_manager.dart';
import 'package:topkapi_bank/line/view_models/payment/payment_manager.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';

import 'app/tab_bar_manager.dart';
import 'credit_card/credit_card_manager.dart';
import 'eft/transaction_manager.dart';

final currentLoadingManager =
    StateNotifierProvider<LoadingStateManagerNotifier, LoadingStates>((ref) {
  return LoadingStateManagerNotifier(LoadingStates.idle);
});

//You can handle all authentication bussiniess logics
final currentBankUser =
    StateNotifierProvider<CurrentBankUserNotifier, BankUser?>((ref) {
  return CurrentBankUserNotifier(null);
});

//You can handle all authentication bussiniess logics
final currentBaseAuth =
    StateNotifierProvider<BaseAuthProvideNotifier, BaseAuthPageType>((ref) {
  return BaseAuthProvideNotifier(BaseAuthPageType.login);
});

final currentQrSendMoneyState =
StateNotifierProvider<QrSendStatesControlNotifier, QrSendStates>((ref) {
  return QrSendStatesControlNotifier(QrSendStates.search);
});

final currentPaymentWorks =
    StateNotifierProvider<PaymentProviderNotifier, void>((ref) {
  return PaymentProviderNotifier(null);
});
//CreditCardManagerNotifier
final currentCreditCardWorks =
StateNotifierProvider<CreditCardManagerNotifier, bool>((ref) {
  return CreditCardManagerNotifier(false);
});

final currentSendMoneyTabManagerIndex =
StateNotifierProvider<TabManagerIndexControlNotifier, int>((ref) {
  return TabManagerIndexControlNotifier(0);
});


final currentCustomTransactionManager =
StateNotifierProvider<TransactionManagerNotifier, void>((ref) {
  return TransactionManagerNotifier(null);
});